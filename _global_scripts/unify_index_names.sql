/*******************************************************************************

Unify Index Names
=================

Unify the names of indexes in the current schema to the following naming
convention:

    <table_name>_<column_list>_<constraint_type>_IX

To ensure distinct index names, up to three underscores are appended when
names are already in use (rare cases, but possible). Each column in the column
list is constructed by concatenating the character `C` with the column id in
the table. The column list is ordered by the column position in the index.

Example index names:

- `OEHR_EMPLOYEES_C1_PK_IX`
- `OEHR_EMPLOYEES_C4_UK_IX`
- `OEHR_EMPLOYEES_C3_C2_IX`
- `OEHR_EMPLOYEES_C11_FK_IX`

Usage
-----
- `@unify_index_names.sql ""` (all indexes in current schema)
- `@unify_index_names.sql "OEHR"` (only indexes from tables prefixed with "OEHR")

Meta
----
- Author: [Ottmar Gobrecht](https://ogobrecht.github.io)
- Script: [unify_index_names.sql](https://github.com/ogobrecht/oracle-sql-scripts/blob/master/unify_index_names.sql)
- Last Update: 2020-03-25

*******************************************************************************/

set define on serveroutput on verify off feedback off
prompt UNIFY INDEX NAMES
declare
  v_prefix varchar2(100 char);
  v_count  pls_integer := 0;
begin
  v_prefix := '&1';
  if v_prefix is not null then
    dbms_output.put_line('- for tables prefixed with "' || v_prefix || '"');
  else
    dbms_output.put_line('- for all tables');
  end if;
  for i in (
--------------------------------------------------------------------------------
with
index_column_expressions as (
  -- working with long columns: http://www.oracle-developer.net/display.php?id=430
  select
    x.index_name,
    x.table_name,
    x.column_position,
    x.column_expression -- type long :-(
  from
    xmltable('/ROWSET/ROW'
      passing (select dbms_xmlgen.getxmltype(
        q'[select * from user_ind_expressions where table_name not like 'BIN%']'
        ) from dual)
      columns
        index_name        varchar2(128 char)  path 'INDEX_NAME',
        table_name        varchar2(128 char)  path 'TABLE_NAME',
        column_position   varchar2(128 char)  path 'COLUMN_POSITION',
        column_expression varchar2(4000 char) path 'COLUMN_EXPRESSION') x
),
indexes_base as (
  select
    ui.table_name,
    ui.index_name,
    listagg(uic.column_name, ',') within group(order by uic.column_position) as column_list,
    listagg('C' || utc.column_id, '_') within group(order by uic.column_position) as column_ids,
    case when ui.uniqueness = 'UNIQUE' then 'UK' end as uniqueness
  from
    sys.user_indexes                   ui
    join sys.user_ind_columns          uic on ui.table_name = uic.table_name and ui.index_name = uic.index_name
    left join index_column_expressions ice on uic.index_name = ice.index_name and uic.column_position = ice.column_position
    left join sys.user_tab_columns     utc on ui.table_name = utc.table_name
                                           and ( uic.column_name = utc.column_name
                                                 or
                                                 instr(ice.column_expression, utc.column_name) > 0 )
  where
    ui.table_name like case when v_prefix is not null then v_prefix || '\_%' else '%' end escape '\'
    and ui.table_name not like 'BIN$%'
  group by
    ui.table_name,
    ui.index_name,
    ui.uniqueness
  --order by index_name, column_list
),
constraints_pk_fk as (
  select
    uc.constraint_name,
    uc.table_name,
    replace(uc.constraint_type, 'R', 'F') || 'K' as constraint_type,
    listagg(ucc.column_name, ',') within group(order by ucc.position) as column_list
  from
    sys.user_constraints       uc
    join sys.user_cons_columns ucc on uc.constraint_name = ucc.constraint_name
  where
    constraint_type in('P','R')
    and uc.table_name not like 'BIN$%'
    and uc.table_name like case when v_prefix is not null then v_prefix || '\_%' else '%' end escape '\'
  group by
    uc.table_name,
    uc.constraint_type,
    uc.constraint_name
  --order by uc.table_name, column_list
),
indexes_ as (
  select
    i.table_name,
    i.index_name,
    i.table_name || '_' || i.column_ids
      || case when c.constraint_type is not null or i.uniqueness is not null then '_' || coalesce(c.constraint_type, i.uniqueness) end
      || '_IX' as new_index_name,
    i.column_list,
    i.column_ids,
    i.uniqueness,
    c.constraint_name,
    c.constraint_type
  from indexes_base             i
    left join constraints_pk_fk c on  i.table_name  = c.table_name
                                  and i.column_list = c.column_list
),
indexes_distinct as (
select
  table_name,
  index_name,
  new_index_name ||
    -- Append underscore if previous one has the same name.
    case
      when lead(new_index_name, 1) over(order by new_index_name, index_name) = new_index_name
      then '_'
    end ||
    -- Append underscore if previous previous one has the same name.
    case
      when lead(new_index_name, 2) over(order by new_index_name, index_name) = new_index_name
      then '_'
    end ||
    -- Append underscore if previous previous previous one has the same name.
    -- We will stop here: Please check your constraints if you encounter more than three times the same resulting name ;-)
    case
      when lead(new_index_name, 3) over(order by new_index_name, index_name) = new_index_name
      then '_'
    end
  as new_index_name
from
  indexes_
where
  new_index_name != index_name
)
select
  table_name,
  index_name,
  new_index_name,
  'alter index ' || index_name || ' rename to ' || new_index_name as ddl
from
  indexes_distinct
order by
  table_name,
  new_index_name,
  index_name
--------------------------------------------------------------------------------
  ) loop
    execute immediate i.ddl;
    v_count := v_count + 1;
  end loop;
  dbms_output.put_line('- ' || v_count || ' indexes renamed');
end;
/
