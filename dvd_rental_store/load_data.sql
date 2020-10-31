@../_global_scripts/disable_triggers.sql                '{ table_prefix: "DRS", dry_run: false }'

prompt LOAD DATA

@data/drs_actor.sql
@data/drs_address.sql
@data/drs_category.sql
@data/drs_city.sql
@data/drs_country.sql
@data/drs_customer.sql
@data/drs_film_actor.sql
@data/drs_film_category.sql
@data/drs_film.sql
@data/drs_inventory.sql
@data/drs_language.sql
@data/drs_payment.sql
@data/drs_rental.sql
@data/drs_staff.sql
@data/drs_store.sql

@../_global_scripts/enable_triggers.sql                '{ table_prefix: "DRS", dry_run: false }'
@../_global_scripts/enable_foreign_key_constraints.sql '{ table_prefix: "DRS", dry_run: false }'
@../_global_scripts/sync_sequence_values_to_data.sql   '{ table_prefix: "DRS", dry_run: false }'
