/*

Create Missing Foreign Keys
===========================

This script is new and not heavily tested. It will currently only work with some naming conventions and restrictions:

- Case one - the fk column name is constructed by the target table and pk column name:
  - users.country_id will find the primary key countries.id
  - users.manager_user_id will find the primary key users.id
- Case two - same as case one but the table names have a prefix
  - hr_users.country_id will find the primary key hr_countries.id
  - hr_users.manager_user_id will find the primary key hr_users.id
- Case three - every column name in a schema is unique and has a prefix:
  - users.u_ctr_id will find the primary key countries.ctr_id
  - users.u_manager_u_id will find the primary key users.u_id
  - simple "id" pk columns will not be used as a target because this can lead to too many false positives
- Does not support multi column primary keys as a target of a foreign key (a standard n:m mapping table with a multi column pk is normally only the source of two or more foreign keys and should work)
- Does not provide an on delete clause - if you need to define one, please create the foreign key by yourself

Options
-------

The first parameter of the script can contain four options:

- table_prefix:
  - Given value will be uppercased, a right underscore be trimmed because we need to inject a backslash
  - Example: `table_prefix=hr` will result in a filter expression `table_name like 'HR\_%' escape '\'`
  - If omitted, it will default to NULL and match then all tables
- exclude_list:
  - A comma separated list of TABLE_NAME:COLUMN_NAME:TARGET_TABLE_NAME keys which should exluded from the potential foreign key list
  - Given value will be uppercased
  - Example: `my_tab_1:col3:my_target_tab1,MY_TAB_2:COL3:MY_TARGET_TAB2`
  - This can be useful in rare cases to suppress false positives (I was not able to find another way without losing correct candidates or blow up the number of false positives)
  - If omitted, it will default to 'no_list_entries' (which results in not filtered potential foreign keys)
- on_delete_set_null_list:
  - A comma separated list of TABLE_NAME:COLUMN_NAME:TARGET_TABLE_NAME keys which should have the "on delete set null" reference clause
  - Given value will be uppercased
  - Example: `my_tab_1:col3:my_target_tab1,MY_TAB_2:COL3:MY_TARGET_TAB2`
  - If omitted, it will default to 'no_list_entries' (which results in no reference clause for all potential foreign keys)
- on_delete_cascade_list:
  - A comma separated list of TABLE_NAME:COLUMN_NAME:TARGET_TABLE_NAME keys which should have the "on delete cascade" reference clause
  - Given value will be uppercased
  - Example: `my_tab_1:col3:my_target_tab1,MY_TAB_2:COL3:MY_TARGET_TAB2`
  - If omitted, it will default to 'no_list_entries' (which results in no reference clause for all potential foreign keys)
- disable:
  - `disable=true` will create disabled constraints
  - `disable=false` will create enabled constraints
  - If omitted, it will default to false
- dry_run:
  - `dry_run=true` will only report the intended work and do nothing
  - `dry_run=false` will do the intended work
  - If omitted, it will default to true

Examples
--------

    @create_missing_foreign_keys.sql ""
    @create_missing_foreign_keys.sql "dry_run=true"
    @create_missing_foreign_keys.sql "table_prefix=  dry_run=true"
    @create_missing_foreign_keys.sql "table_prefix=co  dry_run=false"
    @create_missing_foreign_keys.sql "table_prefix=CO  dry_run=false  exclude_list=my_tab_1:col3:my_target_tab1,MY_TAB_2:COL3:MY_TARGET_TAB2"
    @create_missing_foreign_keys.sql "table_prefix=co  dry_run=false  on_delete_set_null_list=my_tab_1:col3:my_target_tab1"

Meta
----
- Author: [Ottmar Gobrecht](https://ogobrecht.github.io)
- Script: [create_missing_foreign_keys.sql …](https://github.com/ogobrecht/oracle-sql-scripts/blob/master/scripts/)
- Last Update: 2020-12-12

*/

prompt CREATE MISSING FOREIGN KEYS
set define on serveroutput on verify off feedback off linesize 120

declare
  v_table_prefix            varchar2(100);
  v_table_filter            varchar2(100);
  v_exclude_list            varchar2(1000);
  v_on_delete_set_null_list varchar2(1000);
  v_on_delete_cascade_list  varchar2(1000);
  v_disable                 varchar2(100);
  v_constraint_state        varchar2(100);
  v_dry_run                 varchar2(100);
  v_count                   pls_integer := 0;
begin
  v_table_prefix            := rtrim(upper(regexp_substr('&1','table_prefix=([^ ]*)',1,1,'i',1)),'_');
  v_exclude_list            := nvl(upper(regexp_substr('&1','exclude_list=([^ ]*)',1,1,'i',1)), 'no_list_entries');
  v_on_delete_set_null_list := nvl(upper(regexp_substr('&1','on_delete_set_null_list=([^ ]*)',1,1,'i',1)), 'no_list_entries');
  v_on_delete_cascade_list  := nvl(upper(regexp_substr('&1','on_delete_cascade_list=([^ ]*)',1,1,'i',1)), 'no_list_entries');
  v_disable                 := nvl(lower(regexp_substr('&1','disable=(true|false)',1,1,'i',1)), 'false');
  v_dry_run                 := nvl(lower(regexp_substr('&1','dry_run=(true|false)',1,1,'i',1)), 'true');
  if v_table_prefix is null then
    dbms_output.put_line('- for all tables');
    v_table_filter := '%';
  else
    dbms_output.put_line('- for tables prefixed with ''' || v_table_prefix || '''');
    v_table_filter := v_table_prefix || '\_%';
  end if;
  if v_dry_run = 'true' then
    dbms_output.put_line('- dry run entered');
  end if;
  if v_disable = 'true' then
    v_constraint_state := ' disable';
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
     and uc.table_name like v_table_filter escape '\'
) --select * from primary_keys;
,
existing_foreign_keys as (
  select
    ucc.table_name,
    ucc.column_name,
    rucc.table_name  as r_table_name,
    rucc.column_name as r_column_name,
    case uc.delete_rule
      when 'SET NULL' then ' on delete set null'
      when 'CASCADE'  then ' on delete cascade'
      else null
    end as reference_clause
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
    pk.column_name as r_column_name,
    case
      when instr(v_on_delete_set_null_list, utc.table_name||':'||utc.column_name||':'||pk.table_name) > 0 then ' on delete set null'
      when instr(v_on_delete_cascade_list,  utc.table_name||':'||utc.column_name||':'||pk.table_name) > 0 then ' on delete cascade'
      else null
    end as reference_clause
  from
         user_tables ut
    join user_tab_cols utc on ut.table_name = utc.table_name
    join primary_keys  pk  on (
                                --column-names-without-prefixes----------------------------------------------------------
                                utc.column_name like '%' || pk.combined_name
                                -----------------------------------------------------------------------------------------
                                or
                                --column-names-without-prefixes-and-table-names-with-prefix------------------------------
                                v_table_prefix || '_' || utc.column_name like '%' || pk.combined_name
                                -----------------------------------------------------------------------------------------
                                or
                                --column-names-with-prefixes-------------------------------------------------------------
                                utc.column_name like '%\_' || pk.column_name escape '\'
                                and instr(pk.column_name, '_') > 0 --> no simple "id", at least something like "xxx_yy"
                                -----------------------------------------------------------------------------------------
                                or
                                --column-names-equals-pk-column-name-with-prefixes---------------------------------------
                                utc.column_name = pk.column_name
                                and utc.table_name != pk.table_name
                                and instr(pk.column_name, '_') > 0 --> no simple "id", at least something like "xxx_yy"
                                -----------------------------------------------------------------------------------------
                              )
                              and instr(v_exclude_list, utc.table_name||':'||utc.column_name||':'||pk.table_name) = 0

  where
    ut.table_name not like 'BIN$%'
    and ut.table_name like v_table_filter escape '\'
    and pk.number_columns = 1 --> filter out multi column pk's as target
) --select * from potential_foreign_keys;
,
missing_foreign_keys as (
  select * from potential_foreign_keys
  minus
  select * from existing_foreign_keys
)
select
  missing_foreign_keys.*,
  'alter table ' || table_name || ' modify ' || column_name || ' references ' ||
  r_table_name || reference_clause || v_constraint_state as ddl
from
  missing_foreign_keys
order by
  ddl
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
