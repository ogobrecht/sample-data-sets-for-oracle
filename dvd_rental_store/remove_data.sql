@../_global_scripts/disable_foreign_key_constraints.sql "table_prefix=drs  dry_run=false"

prompt REMOVE DATA

prompt - truncate table drs_actor
truncate table drs_actor;

prompt - truncate table drs_address
truncate table drs_address;

prompt - truncate table drs_category
truncate table drs_category;

prompt - truncate table drs_city
truncate table drs_city;

prompt - truncate table drs_country
truncate table drs_country;

prompt - truncate table drs_customer
truncate table drs_customer;

prompt - truncate table drs_film_actor
truncate table drs_film_actor;

prompt - truncate table drs_film_category
truncate table drs_film_category;

prompt - truncate table drs_film
truncate table drs_film;

prompt - truncate table drs_inventory
truncate table drs_inventory;

prompt - truncate table drs_language
truncate table drs_language;

prompt - truncate table drs_payment
truncate table drs_payment;

prompt - truncate table drs_rental
truncate table drs_rental;

prompt - truncate table drs_staff
truncate table drs_staff;

prompt - truncate table drs_store
truncate table drs_store;
