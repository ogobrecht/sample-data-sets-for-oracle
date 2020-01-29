set define off feedback off
whenever sqlerror exit sql.sqlcode rollback
spool refresh_data.log

prompt
prompt Refresh data of sample data model "human resources"
prompt ============================================================
@remove_data.sql
@load_data.sql
prompt ============================================================
prompt Done
prompt

spool off