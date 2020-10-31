/*

Unify Constraint Names
======================

Unify the names of table constraints in the current schema to the following
naming convention:

    <table_name>_<column_list>_<constraint_type>

Each column in the column list is constructed by concatenating the character `C`
with the column id in the table. The column list is ordered by the column
position in the constraint. To ensure distinct constraint names we append
numbers from 1 up to 9 if needed.

Example constraint names:

    OEHR_EMPLOYEES_C1_NN
    OEHR_EMPLOYEES_C1_PK
    OEHR_EMPLOYEES_C4_UK
    OEHR_EMPLOYEES_C10_FK
    OEHR_JOB_HISTORY_C2_C3_CK

Only the constraint types C (check), P (primary key), U (unique key) and
R (referential integrity, foreign key) are supported. Other constraint types
like V (with check option, on a view) or O (with read only, on a view) can not
be renamed and they are created implicitly with their base objects (as far as I
know).

Options
-------

The first parameter of the script can contain a JSON object with two keys:

- table_prefix:
  - If null: Takes all tables of current schema into account
  - If not null: Use the given prefix to filter tables
  - Example: "CO" will be expanded to `table_name like 'CO\_%' escape '\'`
- dry_run:
  - If true, the script will do the intended work
  - If false, the script will only report the intended work and do nothing
  - If omitted, it will default to false

Usage
-----
- `@unify_constraint_names.sql '{ table_prefix: "",     dry_run: false }'` (all tables, do the intended work)
- `@unify_constraint_names.sql '{ table_prefix: "",     dry_run: true  }'` (all tables, report only)
- `@unify_constraint_names.sql '{ table_prefix: "OEHR", dry_run: false }'` (only for tables prefixed with "OEHR")
- `@unify_constraint_names.sql '{ table_prefix: "CO",   dry_run: true  }'` (only for tables prefixed with "CO", report only)

Meta
----
- Author: [Ottmar Gobrecht](https://ogobrecht.github.io)
- Script: [unify_constraint_names.sql …](https://github.com/ogobrecht/oracle-sql-scripts/blob/master/scripts/)
- Last Update: 2020-10-29

*/

prompt UNIFY CONSTRAINT NAMES
set define on serveroutput on verify off feedback off
variable options       varchar2(4000)
variable table_prefix  varchar2(100)
variable dry_run       varchar2(100)

declare
  v_count pls_integer := 0;
begin
  :options      := '&1';
  :table_prefix := json_value(:options, '$.table_prefix');
  :dry_run      := nvl(json_value(:options, '$.dry_run'), 'false');
  if :table_prefix is not null then
    dbms_output.put_line('- for tables prefixed with "' || :table_prefix || '_"');
  else
    dbms_output.put_line('- for all tables');
  end if;
  if :dry_run = 'true' then
    dbms_output.put_line('- dry run entered');
  end if;
  for i in (
--------------------------------------------------------------------------------
with constraints_base as (
  select
    uc.table_name,
    uc.constraint_name,
    uc.search_condition_vc,
    case
      when uc.constraint_type = 'C' and
           regexp_like ( uc.search_condition_vc,
                         '^\s*"{0,1}'
                         || utc.column_name
                         || '"{0,1}\s+is\s+not\s+null\s*$',
                         'i' )
        then 'NN'
      when uc.constraint_type = 'R'
        then 'FK'
      when uc.constraint_type in ('C','P','U')
        then uc.constraint_type || 'K'
      else uc.constraint_type
    end as constraint_type,
    utc.column_name,
    utc.column_id,
    ucc.position
  from
         user_constraints  uc
    left join user_cons_columns ucc on  uc.constraint_name = ucc.constraint_name
    left join user_tab_columns  utc on  ucc.table_name     = utc.table_name
                                    and ucc.column_name    = utc.column_name
  where
    uc.table_name like case when :table_prefix is not null then :table_prefix || '\_%' else '%' end escape '\'
    and uc.constraint_type in ('C','P','U','R') -- only the types we can rename
    and uc.table_name not like 'BIN$%'
  group by
    uc.table_name,
    uc.constraint_name,
    uc.constraint_type,
    utc.column_name,
    utc.column_id,
    ucc.position,
    uc.search_condition_vc
),
constraints as (
  select
    table_name,
    constraint_name,
    table_name || '_'
      || listagg('C' || column_id, '_') within group(order by position)
      || '_' || constraint_type
    as new_constraint_name,
    search_condition_vc
  from
    constraints_base
  group by
    table_name,
    search_condition_vc,
    constraint_name,
    constraint_type
),
constraints_distinct as (
select
  table_name,
  constraint_name,
  new_constraint_name ||
    case
      when lead(new_constraint_name, 1) over(order by new_constraint_name, search_condition_vc, constraint_name) = new_constraint_name then '1'
      when  lag(new_constraint_name, 8) over(order by new_constraint_name, search_condition_vc, constraint_name) = new_constraint_name then '9'
      when  lag(new_constraint_name, 7) over(order by new_constraint_name, search_condition_vc, constraint_name) = new_constraint_name then '8'
      when  lag(new_constraint_name, 6) over(order by new_constraint_name, search_condition_vc, constraint_name) = new_constraint_name then '7'
      when  lag(new_constraint_name, 5) over(order by new_constraint_name, search_condition_vc, constraint_name) = new_constraint_name then '6'
      when  lag(new_constraint_name, 4) over(order by new_constraint_name, search_condition_vc, constraint_name) = new_constraint_name then '5'
      when  lag(new_constraint_name, 3) over(order by new_constraint_name, search_condition_vc, constraint_name) = new_constraint_name then '4'
      when  lag(new_constraint_name, 2) over(order by new_constraint_name, search_condition_vc, constraint_name) = new_constraint_name then '3'
      when  lag(new_constraint_name, 1) over(order by new_constraint_name, search_condition_vc, constraint_name) = new_constraint_name then '2'
    end
  as new_constraint_name
from
  constraints
where
  new_constraint_name != constraint_name
)
select
  table_name,
  constraint_name,
  new_constraint_name,
  'alter table ' || table_name || ' rename constraint ' || constraint_name || ' to ' || new_constraint_name as ddl
from
  constraints_distinct
order by
  table_name,
  new_constraint_name,
  constraint_name
--------------------------------------------------------------------------------
  ) loop
    dbms_output.put_line('- ' || i.ddl);
    if :dry_run = 'false' then
      execute immediate i.ddl;
    end if;
    v_count := v_count + 1;
  end loop;

  dbms_output.put_line('- ' || v_count || ' constraint'
    || case when v_count != 1 then 's' end || ' '
    || case when :dry_run = 'false' then 'renamed' else 'reported' end);
end;
/
