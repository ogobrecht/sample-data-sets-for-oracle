/*

Create Missing Foreign Keys
===========================

This script is new and not heavily tested. It will currently only work with a good designed data model with some naming conventions and restrictions:

- Every column name in a schema is unique and has a prefix (e.g. `customer_orders.co_id` or `users.u_name`)
- That means also: You need to have for every table a different column prefix (`co_` or `u_` from the examples above)
- Self references in a hierarchy need to follow this also (e.g. users.u_id, users.u_manager_u_id)
- Does not support multi column primary keys as target of a foreign key (a standard n:m mapping table with a multi column pk is normally only the source of two or more foreign keys and should work)
- Does not provide an on delete clause - if you need to define one, please create the foreign key by yourself

Options
-------

The first parameter of the script can contain two options:

- table_filter:
  - A like expression (escape char is '\')
  - Example: `table_filter=CO\_%` will be expanded to `table_name like 'CO\_%' escape '\'`
  - If omitted, it will default to '%' (matches all tables)
- dry_run:
  - `dry_run=true` will only report the intended work and do nothing
  - `dry_run=false` will do the intended work
  - If omitted, it will default to true

Examples
--------

    @create_missing_foreign_keys.sql "table_filter=%  dry_run=true"
    @create_missing_foreign_keys.sql "table_filter=CO\_%  dry_run=false"

Meta
----
- Author: [Ottmar Gobrecht](https://ogobrecht.github.io)
- Script: [create_missing_foreign_keys.sql …](https://github.com/ogobrecht/oracle-sql-scripts/blob/master/scripts/)
- Last Update: 2020-11-01

*/

prompt CREATE MISSING FOREIGN KEYS
set define on serveroutput on verify off feedback off linesize 120

declare
  v_table_filter varchar2(100);
  v_dry_run      varchar2(100);
  v_count        pls_integer := 0;
begin
  v_table_filter := nvl(regexp_substr('&1','table_filter=([^ ]*)',1,1,'i',1), '%');
  v_dry_run := nvl(lower(regexp_substr('&1','dry_run=(true|false)',1,1,'i',1)), 'true');
  if v_table_filter = '%' then
    dbms_output.put_line('- for all tables');
  else
    dbms_output.put_line('- for tables like ''' || v_table_filter || '''');
  end if;
  if v_dry_run = 'true' then
    dbms_output.put_line('- dry run entered');
  end if;
  for i in (
--------------------------------------------------------------------------------
with primary_keys as (
  select
    ucc.table_name,
    ucc.column_name
  from
         user_constraints uc
    join user_cons_columns ucc on uc.constraint_name = ucc.constraint_name
  where
    uc.constraint_type = 'P'
    and uc.table_name not like 'BIN$%'
    and uc.table_name like v_table_filter escape '\'
    /* Without the following filter we would find too many matches with bad data models (without a column prefix).
    For example when you have logger installed which uses `id` as pk and your fk columns ends all with `_id`.
    We explicitly do not filter for pks ending with `_id` to support also natural keys like for example
    a currency pk column named cur_iso or a users table with a pk named u_login_name. If don*t see the point, then
    play around without this filter and see what happens. */
    and ucc.column_name like '%\_%' escape '\'
) --select * from primary_keys;
,
existing_foreign_keys as (
  select
    ucc.table_name,
    ucc.column_name,
    rucc.table_name     as r_table_name,
    rucc.column_name    as r_column_name
  from
         user_constraints uc
    join user_cons_columns  ucc on uc.constraint_name = ucc.constraint_name
    join user_constraints   ruc on uc.r_constraint_name = ruc.constraint_name
    join user_cons_columns  rucc on ruc.constraint_name = rucc.constraint_name
  where
    uc.constraint_type = 'R'
    and uc.table_name not like 'BIN$%'
    and uc.table_name like v_table_filter escape '\'
) --select * from existing_foreign_keys;
,
potential_foreign_keys as (
  select distinct
    utc.table_name,
    utc.column_name,
    pk.table_name     as r_table_name,
    pk.column_name    as r_column_name
  from
         user_tables ut
    join user_tab_cols  utc on ut.table_name = utc.table_name
    join primary_keys   pk on utc.column_name like '%\_' || pk.column_name escape '\'
  where
    ut.table_name not like 'BIN$%'
    and ut.table_name like v_table_filter escape '\'
) --select * from potential_foreign_keys;
,
missing_foreign_keys as (
  select * from potential_foreign_keys
  minus
  select * from existing_foreign_keys
)
select
  missing_foreign_keys.*,
  'alter table ' || table_name || ' modify ' || column_name || ' references ' || r_table_name as ddl
from
  missing_foreign_keys
--------------------------------------------------------------------------------
  ) loop
    dbms_output.put_line('- ' || i.ddl);
    if v_dry_run = 'false' then
      execute immediate i.ddl;
    end if;
    v_count := v_count + 1;
  end loop;

  dbms_output.put_line('- ' || v_count || ' foreign key'
    || case when v_count != 1 then 's' end || ' '
    || case when v_dry_run = 'false' then 'created' else 'reported' end);
end;
/
