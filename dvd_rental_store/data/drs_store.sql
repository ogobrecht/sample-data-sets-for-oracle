-- Script generated by PLEX version 2.4.0 - more infos here: https://github.com/ogobrecht/plex
-- Performance Hacks by Connor McDonald: https://connor-mcdonald.com/2019/05/17/hacking-together-faster-inserts/
-- For strange line end replacements a big thank to SQL*Plus: https://support.oracle.com/epmos/faces/DocumentDisplay?id=2377701.1 (SQL Failed With ORA-1756 In Sqlplus But Works In SQL Developer)
prompt - insert      2 rows into DRS_STORE
set define off feedback off sqlblanklines on
alter session set cursor_sharing = force;
alter session set nls_numeric_characters = '.,';
alter session set nls_date_format = 'yyyy-mm-dd hh24:mi:ss';
alter session set nls_timestamp_format = 'yyyy-mm-dd hh24:mi:ssxff';
alter session set nls_timestamp_tz_format = 'yyyy-mm-dd hh24:mi:ssxff tzr';
begin
insert all
into DRS_STORE(STORE_ID,MANAGER_STAFF_ID,ADDRESS_ID,LAST_UPDATE) values (1,1,1,'2006-02-15 04:57:12')
into DRS_STORE(STORE_ID,MANAGER_STAFF_ID,ADDRESS_ID,LAST_UPDATE) values (2,2,2,'2006-02-15 04:57:12')
select * from dual;
end;
/
commit;
alter session set cursor_sharing = exact;

