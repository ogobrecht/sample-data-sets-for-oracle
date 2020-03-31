set define on serveroutput on verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
column date_time new_val date_time
select to_char(sysdate,'yyyymmdd_hh24miss') as date_time from dual;
spool _logs/&date_time._refresh_data.log

prompt
prompt Refresh data of sample data model "human resources"
prompt ================================================================================
@remove_data.sql
@load_data.sql
prompt ================================================================================
prompt Done
prompt

spool off