begin for i in (
--------------------------------------------------------------------------------
with needed_indexes as (
  select
    uc.table_name,
    listagg(ucc.column_name, ',') within group(order by ucc.position) as column_list,
    listagg('C' || utc.column_id, '_') within group(order by utc.column_id) as column_ids
  from
    sys.user_constraints       uc
    join sys.user_cons_columns ucc on uc.constraint_name = ucc.constraint_name
    join sys.user_tab_columns  utc on uc.table_name = utc.table_name and ucc.column_name = utc.column_name
  where
    constraint_type = 'R'
    and uc.table_name not like 'BIN$%'
    and uc.table_name like case when :prefix is not null then :prefix || '\_%' else '%' end escape '\'
  group by
    uc.table_name,
    uc.constraint_name
    --order by uc.table_name, column_list
),
existing_indexes as (
  select
    table_name,
    listagg(column_name, ',') within group(order by column_position) column_list
  from
    user_ind_columns
  where
    table_name not like 'BIN$%'
  group by
    table_name,
    index_name
    --order by table_name, column_list
)
select
  n.table_name,
  n.column_list as needed_index_columns,
  e.column_list as existing_index_columns,
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
    execute immediate i.ddl;
  end loop;
end;
/
