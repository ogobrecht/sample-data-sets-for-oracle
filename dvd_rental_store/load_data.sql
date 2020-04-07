prompt LOAD DATA

set timing on

--@data/data.sql
--@data/drs_actor.sql
--@data/drs_address.sql
--@data/drs_category.sql
--@data/drs_city.sql
--@data/drs_country.sql
--@data/drs_customer.sql
--@data/drs_film_actor.sql
--@data/drs_film_category.sql
@data/drs_film.sql
--@data/drs_film_test.sql
--@data/drs_inventory.sql
--@data/drs_language.sql
--@data/drs_payment.sql
--@data/drs_rental.sql
--@data/drs_staff.sql
--@data/drs_store.sql

set timing off

@../_global_scripts/enable_all_foreign_key_constraints.sql "DRS"
@../_global_scripts/sync_sequence_values_to_data.sql "DRS"
