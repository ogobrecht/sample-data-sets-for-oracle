set define on serveroutput on verify off feedback off
whenever sqlerror continue
column date_time new_val date_time
select to_char(sysdate,'yyyymmdd_hh24miss') as date_time from dual;
spool _logs/&date_time._uninstall.log

prompt
prompt Uninstall sample data model "human resources"
prompt ================================================================================
@drop_objects.sql
prompt ================================================================================
prompt Done
prompt

spool off
