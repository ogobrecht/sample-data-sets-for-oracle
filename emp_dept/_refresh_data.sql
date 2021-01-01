set define on serveroutput on trimspool on verify off feedback off linesize 240
whenever sqlerror exit sql.sqlcode rollback
timing start refresh_data
column date_time new_val date_time noprint
select to_char(sysdate,'yyyymmdd_hh24miss') as date_time from dual;
spool _logs/&date_time._refresh_data.log

prompt
prompt Refresh data of sample data set "EMP, DEPT"
prompt ================================================================================
@remove_data.sql
@load_data.sql
timing stop
prompt ================================================================================
prompt Done
prompt

spool off