set define on verify off
prompt - manage constraint names with prefix "&1"
variable prefix varchar2(10)
BEGIN
  :prefix := '&1';
END;
/
set define off

BEGIN
  FOR i IN (
------------------------------------------------------------
with base as (
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
    uc.table_name like upper(:prefix) || '\_%' escape '\'
  group by
    uc.table_name,
    uc.constraint_name,
    uc.constraint_type,
    utc.column_name,
    utc.column_id,
    uc.search_condition_vc
) --select * from base
, constraints as (
  select
    table_name,
    table_name || '_' || constraint_type || '_' 
    || listagg('C' || column_id, '_') within group(order by column_id)
    as new_constraint_name,
    constraint_name
  from
    base
  group by
    table_name,
    constraint_name,
    constraint_type
) --select * from constraints
select
  table_name,
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
      when lag(new_constraint_name, 3) over(order by new_constraint_name, constraint_name) = new_constraint_name
      then '_'
    end
  as new_constraint_name,
  constraint_name
from
  constraints
where
  new_constraint_name != constraint_name
order by
  table_name,
  new_constraint_name,
  constraint_name
------------------------------------------------------------
            ) LOOP
    EXECUTE IMMEDIATE REPLACE(REPLACE(REPLACE(q'[
      ALTER TABLE #TABLE_NAME# RENAME CONSTRAINT #CONSTRAINT_NAME# TO #NEW_CONSTRAINT_NAME#
    ]',
                                              '#TABLE_NAME#',
                                              i.table_name),
                                      '#CONSTRAINT_NAME#',
                                      i.constraint_name),
                              '#NEW_CONSTRAINT_NAME#',
                              i.new_constraint_name);
  END LOOP;
END;
/
