@../_global_scripts/disable_all_foreign_key_constraints.sql "DRS"

prompt DROP OBJECTS

prompt - view xxx
drop view xxx;

prompt - table drs_actor
drop table drs_actor cascade constraints purge;

prompt - table drs_city
drop table drs_city cascade constraints purge;

prompt - table drs_country
drop table drs_country cascade constraints purge;
