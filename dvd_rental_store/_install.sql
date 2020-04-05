set define on serveroutput on verify off feedback off timing off
whenever sqlerror exit sql.sqlcode rollback
column date_time new_val date_time
select to_char(sysdate,'yyyymmdd_hh24miss') as date_time from dual;
spool _logs/&date_time._install.log

prompt
prompt Install sample data model "human resources"
prompt ================================================================================
@create_objects.sql
@load_data.sql
prompt ================================================================================
prompt Done
prompt

spool off