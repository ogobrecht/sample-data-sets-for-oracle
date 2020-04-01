prompt LOAD DATA

@data/drs_actor.sql
@data/drs_city.sql
@data/drs_country.sql
@data/xxx.sql
@data/xxx.sql
@data/xxx.sql
@data/xxx.sql

prompt - commit work
commit;

@../_global_scripts/enable_all_foreign_key_constraints.sql "DRS"
@../_global_scripts/sync_sequence_values_to_data.sql "DRS"
