/*

Create Missing Foreign Keys
===========================

This script is new and not heavily tested. It will currently only work with some naming conventions and restrictions:

- Case one - the fk column name is constructed by the target table and pk column name:
  - users.manager_user_id will find the primary key users.id
  - users.country_id will find the primary key countries.id
- Case two - every column name in a schema is unique and has a prefix:
  - users.u_manager_u_id will find the primary key users.u_id
  - users.u_ctr_id will find the primary key countries.ctr_id
  - simple "id" pk columns will not be used as a target because this can lead to too many created foreign keys
- Does not support multi column primary keys as a target of a foreign key (a standard n:m mapping table with a multi column pk is normally only the source of two or more foreign keys and should work)
- Does not provide an on delete clause - if you need to define one, please create the foreign key by yourself

Options
-------

The first parameter of the script can contain three options:

- table_filter:
  - A like expression (escape char is '\')
  - Example: `table_filter=CO\_%` will be expanded to `table_name like 'CO\_%' escape '\'`
  - If omitted, it will default to '%' (matches all tables)
- exclude_list:
  - A comma separated list of TABLE_NAME:COLUMN_NAME:TARGET_TABLE_NAME keys which should exluded from the potential foreign key list
  - Example: `MY_TAB_1:COL3:MY_TARGET_TAB1,MY_TAB_2:COL3:MY_TARGET_TAB2`
  - This can be useful in rare cases to suppress false positives (I was not able to find another way without losing correct candidates or blow up the number of false positives)
  - If omitted, it will default to 'no_list_entries' (which results in no filtered potential foreign keys)
- dry_run:
  - `dry_run=true` will only report the intended work and do nothing
  - `dry_run=false` will do the intended work
  - If omitted, it will default to true

Examples
--------

    @create_missing_foreign_keys.sql "table_filter=%  dry_run=true"
    @create_missing_foreign_keys.sql "table_filter=CO\_%  dry_run=false"
    @create_missing_foreign_keys.sql "table_filter=CO\_%  dry_run=false exclude_list=MY_TAB_1:COL3:MY_TARGET_TAB1,MY_TAB_2:COL3:MY_TARGET_TAB2"

Meta
----
- Author: [Ottmar Gobrecht](https://ogobrecht.github.io)
- Script: [create_missing_foreign_keys.sql …](https://github.com/ogobrecht/oracle-sql-scripts/blob/master/scripts/)
- Last Update: 2020-12-02

*/

prompt CREATE MISSING FOREIGN KEYS
set define on serveroutput on verify off feedback off linesize 120

declare
  v_table_filter varchar2(100);
  v_exclude_list varchar2(1000);
  v_dry_run      varchar2(100);
  v_count        pls_integer := 0;
begin
  v_table_filter := nvl(regexp_substr('&1','table_filter=([^ ]*)',1,1,'i',1), '%');
  v_exclude_list := nvl(regexp_substr('&1','exclude_list=([^ ]*)',1,1,'i',1), 'no_list_entries');
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
  select ucc.table_name,
         ucc.column_name,
         regexp_replace(replace(ucc.table_name, 'IES', 'Y'), 'S$', '') || '_' || ucc.column_name as combined_name,
         count(*) over (partition by ucc.table_name) as number_columns
    from user_constraints uc
    join user_cons_columns ucc
      on uc.constraint_name = ucc.constraint_name
   where uc.constraint_type = 'P'
     and uc.table_name not like 'BIN$%'
     and uc.table_name like '%' escape '\'
) --select * from primary_keys;
,
existing_foreign_keys as (
  select
    ucc.table_name,
    ucc.column_name,
    rucc.table_name  as r_table_name,
    rucc.column_name as r_column_name
  from
         user_constraints  uc
    join user_cons_columns ucc  on uc.constraint_name   = ucc.constraint_name
    join user_constraints  ruc  on uc.r_constraint_name = ruc.constraint_name
    join user_cons_columns rucc on ruc.constraint_name  = rucc.constraint_name
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
    pk.table_name  as r_table_name,
    pk.column_name as r_column_name
  from
         user_tables ut
    join user_tab_cols utc on ut.table_name = utc.table_name
    join primary_keys  pk  on (-- column names without prefixes
                               utc.column_name like '%' || pk.combined_name
                               and instr(v_exclude_list, utc.table_name||':'||utc.column_name||':'||pk.table_name) = 0
                               or
                               -- column names with prefixes
                               utc.column_name like '%\_' || pk.column_name escape '\'
                               and instr(pk.column_name, '_') > 0 --> no simple "id", at least something like "xxx_yy"
                               and instr(v_exclude_list, utc.table_name||':'||utc.column_name||':'||pk.table_name) = 0
                               )
  where
    ut.table_name not like 'BIN$%'
    and ut.table_name like v_table_filter escape '\'
    and pk.number_columns = 1 -- filter out multi column pk's as target
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
