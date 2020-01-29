set define off feedback off
whenever sqlerror exit sql.sqlcode rollback
spool install.log

prompt
prompt Install sample data model "human resources"
prompt ============================================================
@create_objects.sql
@load_data.sql
prompt ============================================================
prompt Done
prompt

spool off