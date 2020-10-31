/*

Create Missing Foreign Key Indexes
==================================

Missing indexes are created with the following naming convention:

    <table_name>_<column_list>_FK_IX

Each column in the column list is constructed by concatenating the character `C`
with the column position in the table. The column list is ordered by the column
position in the index.

Example index names:

    OEHR_EMPLOYEES_C7_FK_IX
    OEHR_EMPLOYEES_C10_FK_IX
    OEHR_EMPLOYEES_C11_FK_IX

Options
-------

The first parameter of the script can contain a JSON object with two keys:

- table_filter:
  - A like expression (escape char is '\')
  - Example: 'CO\_%' will be expanded to table_name like 'CO\_%' escape '\'
  - If omitted, it will default to '%' (matches all tables)
- dry_run:
  - If true, the script will only report the intended work and do nothing
  - If false, the script will do the intended work
  - If omitted, it will default to true

Examples
--------

    @create_missing_foreign_key_indexes.sql "{ table_filter: '%',     dry_run: false }"
    @create_missing_foreign_key_indexes.sql "{ table_filter: 'CO\_%', dry_run: true  }"

Meta
----
- Author: [Ottmar Gobrecht](https://ogobrecht.github.io)
- Script: [create_missing_foreign_key_indexes.sql …](https://github.com/ogobrecht/oracle-sql-scripts/blob/master/scripts/)
- Last Update: 2020-10-29

*/

prompt CREATE MISSING FOREIGN KEY INDEXES
set define on serveroutput on verify off feedback off linesize 120
variable options       varchar2(4000)
variable table_filter  varchar2(100)
variable dry_run       varchar2(100)

declare
  v_count pls_integer := 0;
begin
  :options      := q'[&1]';
  :table_filter := nvl(json_value(:options, '$.table_filter'), '%');
  :dry_run      := nvl(json_value(:options, '$.dry_run'), 'true');
  if :table_filter = '%' then
    dbms_output.put_line('- for all tables');
  else
    dbms_output.put_line('- for tables like ''' || :table_filter || '''');
  end if;
  if :dry_run = 'true' then
    dbms_output.put_line('- dry run entered');
  end if;
  for i in (
--------------------------------------------------------------------------------
with needed_indexes as (
  select
    uc.table_name,
    listagg(ucc.column_name, ',') within group(order by ucc.position) as column_list,
    listagg('C' || utc.column_id, '_') within group(order by ucc.position) as column_ids
  from
    sys.user_constraints       uc
    join sys.user_cons_columns ucc on uc.constraint_name = ucc.constraint_name
    join sys.user_tab_columns  utc on uc.table_name = utc.table_name and ucc.column_name = utc.column_name
  where
    constraint_type = 'R'
    and uc.table_name not like 'BIN$%'
    and uc.table_name like :table_filter escape '\'
  group by
    uc.table_name,
    uc.constraint_name
) --select * from needed_indexes order by table_name, column_list;
,
existing_indexes as (
  select
    table_name,
    listagg(column_name, ',') within group(order by column_position) column_list
  from
    user_ind_columns
  where
    table_name not like 'BIN$%'
    and table_name like :table_filter escape '\'
  group by
    table_name,
    index_name
) --select * from existing_indexes order by table_name, column_list;
select
  n.table_name,
  n.column_list as needed_index_column,
  e.column_list as existing_index_column,
  case when e.column_list is null then
    'create index ' || n.table_name || '_' || n.column_ids || '_fk_ix'
    || ' on ' || n.table_name || ' (' || n.column_list || ')'
  end as ddl
from
  needed_indexes             n
  left join existing_indexes e on n.table_name = e.table_name
                               and instr(e.column_list, n.column_list) = 1
where e.column_list is null
--------------------------------------------------------------------------------
  ) loop
    dbms_output.put_line('- ' || i.ddl);
    if :dry_run = 'false' then
      execute immediate i.ddl;
    end if;
    v_count := v_count + 1;
  end loop;

  dbms_output.put_line('- ' || v_count || ' index'
    || case when v_count != 1 then 'es' end || ' '
    || case when :dry_run = 'false' then 'created' else 'reported' end);
end;
/
