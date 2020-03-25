/*******************************************************************************
# Unify Constraint Names

Unify the names of constraints to the following naming convention:

    <table_name>_<column_list>_<constraint_type><additional_underscores_for_distinct_names>

Example constraint Names:

- EMPLOYEES_C1_NN
- EMPLOYEES_C1_PK
- EMPLOYEES_C7_FK
- JOB_HISTORY_C2_C3_CK

## Usage

    -- all constraints in current schema
    @unify_constraint_names.sql

    -- only constraints from tables prefixed with HR
    @unify_constraint_names.sql HR

##  Meta
- Author: [Ottmar Gobrecht](https://ogobrecht.github.io)
- Script: [unify_constraint_names.sql](https://github.com/ogobrecht/sql-scripts/unify_constraint_names.sql)

## Changelog
- 2020-03-25: Initial version
*******************************************************************************/

prompt UNIFY CONSTRAINT NAMES
set define on serveroutput on verify off feedback off
variable prefix varchar2(10)

declare
  v_count pls_integer := 0;
begin
  :prefix := '&1';
  if :prefix is not null then
    dbms_output.put_line('- for tables prefixed with ' || :prefix);
  else
    dbms_output.put_line('- for all tables');
  end if;
  for i in (
--------------------------------------------------------------------------------
with constraints_base as (
  select
    uc.table_name,
    uc.constraint_name,
    case
      when regexp_like ( uc.search_condition_vc,
                         '^\s*"{0,1}'
                         || utc.column_name
                         || '"{0,1}\s+is\s+not\s+null\s*$',
                         'i' )
      then 'NN'
      else replace(uc.constraint_type, 'R', 'F') || 'K'
    end as constraint_type,
    utc.column_name,
    utc.column_id
  from
         user_constraints  uc
    join user_cons_columns ucc on  uc.constraint_name = ucc.constraint_name
    join user_tab_columns  utc on  ucc.table_name     = utc.table_name
                               and ucc.column_name    = utc.column_name
  where
    --without prefix we will find all user tables
    uc.table_name like case when :prefix is not null then :prefix || '\_%' else '%' end escape '\'
  group by
    uc.table_name,
    uc.constraint_name,
    uc.constraint_type,
    utc.column_name,
    utc.column_id,
    uc.search_condition_vc
),
constraints as (
  select
    table_name,
    constraint_name,
    table_name || '_'
      || listagg('C' || column_id, '_') within group(order by column_id)
      || '_' || constraint_type
    as new_constraint_name
  from
    constraints_base
  group by
    table_name,
    constraint_name,
    constraint_type
),
constraints_distinct as (
select
  table_name,
  constraint_name,
  new_constraint_name ||
    -- Append underscore if previous one has the same name.
    case
      when lead(new_constraint_name, 1) over(order by new_constraint_name, constraint_name) = new_constraint_name
      then '_'
    end ||
    -- Append underscore if previous previous one has the same name.
    case
      when lead(new_constraint_name, 2) over(order by new_constraint_name, constraint_name) = new_constraint_name
      then '_'
    end ||
    -- Append underscore if previous previous previous one has the same name.
    -- We will stop here: Please check your constraints if you encounter more than three times the same resulting name ;-)
    case
      when lead(new_constraint_name, 3) over(order by new_constraint_name, constraint_name) = new_constraint_name
      then '_'
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
    execute immediate i.ddl;
    v_count := v_count + 1;
  end loop;
  dbms_output.put_line('- ' || v_count || ' constraints renamed');
end;
/
