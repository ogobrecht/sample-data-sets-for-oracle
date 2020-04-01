@../_global_scripts/disable_all_foreign_key_constraints.sql "DRS"

prompt REMOVE DATA

prompt - truncate table drs_actor
truncate table drs_actor;

prompt - truncate table drs_city
truncate table drs_city;

prompt - truncate table drs_country
truncate table drs_country;