set define on verify off
prompt - manage index names for tables prefixed with "&1"
variable prefix varchar2(10)
begin
  :prefix := '&1';
end;
/
set define off

begin for i in (
--------------------------------------------------------------------------------
with indexes_ as (
  select 
    ui.table_name,
    ui.index_name, 
    listagg(uic.column_name, ',') within group(order by uic.column_position) as column_list,
    listagg('C' || utc.column_id, '_') within group(order by utc.column_id) as column_ids,
    case when ui.uniqueness = 'UNIQUE' then 'UK' end as uniqueness
  from
    sys.user_indexes               ui
    join sys.user_ind_columns      uic on ui.index_name   = uic.index_name
    left join sys.user_tab_columns utc on ui.table_name   = utc.table_name 
                                      and uic.column_name = utc.column_name
  where ui.table_name not like 'BIN$%'
    and ui.table_name like case when :prefix is not null then :prefix || '\_%' else '%' end escape '\'
  group by
    ui.table_name,
    ui.index_name,
    ui.uniqueness
  --order by index_name, column_list
),
constraints_ as (
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
    and uc.table_name like case when :prefix is not null then :prefix || '\_%' else '%' end escape '\'
  group by
    uc.table_name,
    uc.constraint_type,
    uc.constraint_name
  --order by uc.table_name, column_list
),
results as (
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
  from indexes_            i
    left join constraints_ c on i.table_name  = c.table_name
                            and i.column_list = c.column_list
)
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
      when lead(new_constraint_name, 3) over(order by new_constraint_name, constraint_name) = new_constraint_name
      then '_'
    end
  as new_constraint_name,
  constraint_name
from
  results
where
  new_constraint_name != constraint_name
order by
  table_name,
  new_constraint_name,
  constraint_name
--------------------------------------------------------------------------------
) loop
    execute immediate
      replace(replace(replace('alter table #TABLE_NAME# rename constraint #CONSTRAINT_NAME# to #NEW_CONSTRAINT_NAME#',
                              '#TABLE_NAME#',
                              i.table_name),
                      '#CONSTRAINT_NAME#',
                      i.constraint_name),
              '#NEW_CONSTRAINT_NAME#',
              i.new_constraint_name);
  end loop;
end;
/
