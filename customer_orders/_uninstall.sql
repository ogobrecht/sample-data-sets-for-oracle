set define off feedback off
whenever sqlerror continue
spool uninstall.log

prompt
prompt Uninstall sample data model "customer orders"
prompt ============================================================
@drop_objects.sql
prompt ============================================================
prompt Done
prompt

spool off
