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
with 
function get_column_expression (
  p_index_name       varchar2,
  p_column_position  integer
) return varchar2 is
  v_return varchar2(4000 char);
begin
  for i in (select column_expression 
              from sys.user_ind_expressions
             where index_name = p_index_name
               and column_position = p_column_position) loop
    v_return := substr(i.column_expression, 1, 4000);
  end loop;
  return v_return;
end;
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
    left join sys.user_ind_expressions uie on uic.index_name = uie.index_name and uic.column_position = uie.column_position
    left join sys.user_tab_columns     utc on ui.table_name = utc.table_name 
                                           and ( uic.column_name = utc.column_name
                                                 or 
                                                 instr(get_column_expression(uic.index_name,uic.column_position), utc.column_name) > 0 )
  where ui.table_name not like 'BIN$%'
    and ui.table_name like case when :prefix is not null then :prefix || '\_%' else '%' end escape '\'
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
    and uc.table_name like case when :prefix is not null then :prefix || '\_%' else '%' end escape '\'
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
  end loop;
end;
/
