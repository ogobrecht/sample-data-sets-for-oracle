@../_global_scripts/disable_all_foreign_key_constraints.sql "DRS"

prompt DROP OBJECTS

prompt - view xxx
drop view xxx;

prompt - table drs_actor
drop table drs_actor cascade constraints purge;

prompt - table drs_address
drop table drs_address cascade constraints purge;

prompt - table drs_category
drop table drs_category cascade constraints purge;

prompt - table drs_city
drop table drs_city cascade constraints purge;

prompt - table drs_country
drop table drs_country cascade constraints purge;

prompt - table drs_customer
drop table drs_customer cascade constraints purge;

prompt - table drs_film
drop table drs_film cascade constraints purge;

prompt - table drs_language
drop table drs_language cascade constraints purge;

prompt - table xxx
drop table xxx cascade constraints purge;

prompt - table xxx
drop table xxx cascade constraints purge;

prompt - table xxx
drop table xxx cascade constraints purge;

prompt - table xxx
drop table xxx cascade constraints purge;

prompt - table xxx
drop table xxx cascade constraints purge;

prompt - table xxx
drop table xxx cascade constraints purge;

prompt - table xxx
drop table xxx cascade constraints purge;

prompt - table xxx
drop table xxx cascade constraints purge;
