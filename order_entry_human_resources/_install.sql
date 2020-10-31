set define on serveroutput on verify off feedback off linesize 240
whenever sqlerror exit sql.sqlcode rollback
timing start install
column date_time new_val date_time noprint noprint
select to_char(sysdate,'yyyymmdd_hh24miss') as date_time from dual;
spool _logs/&date_time._install.log

prompt
prompt Install sample data set "Order Entry and Human Resources"
prompt ================================================================================
@create_objects.sql
@load_data.sql
timing stop
prompt ================================================================================
prompt Done
prompt

spool off