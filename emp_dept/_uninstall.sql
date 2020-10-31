set define on serveroutput on verify off feedback off linesize 240
whenever sqlerror continue
timing start uninstall
column date_time new_val date_time noprint
select to_char(sysdate,'yyyymmdd_hh24miss') as date_time from dual;
spool _logs/&date_time._uninstall.log

prompt
prompt Uninstall sample data model "EMP, DEPT"
prompt ================================================================================
@drop_objects.sql
timing stop
prompt ================================================================================
prompt Done
prompt

spool off
