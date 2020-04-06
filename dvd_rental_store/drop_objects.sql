@../_global_scripts/disable_all_foreign_key_constraints.sql "DRS"

prompt DROP OBJECTS

-- begin
--   for i in (select * from user_objects)loop
--     dbms_output.put_line('- ' || i.object_type || ' ' || i.object_name)
--     --execute immediate i.ddl;
--   end loop
-- end;

prompt - package customers
drop package drs_customers;
prompt - package rentals
drop package drs_rentals;

prompt - view drs_actor_info_v
drop view drs_actor_info_v;
prompt - view drs_customer_list_v
drop view drs_customer_list_v;
prompt - view drs_film_list_v
drop view drs_film_list_v;
prompt - view drs_sales_by_store_v
drop view drs_sales_by_store_v;
prompt - view drs_sales_by_film_category_v
drop view drs_sales_by_film_category_v;
prompt - view drs_staff_list_v
drop view drs_staff_list_v;

prompt - type drs_language_t
drop type drs_language_t force;
prompt - type drs_languages_t
drop type drs_languages_t force;
prompt - type drs_film_t
drop type drs_film_t force;
prompt - type drs_films_t
drop type drs_films_t force;
prompt - type drs_actor_t
drop type drs_actor_t force;
prompt - type drs_actors_t
drop type drs_actors_t force;
prompt - type drs_category_t
drop type drs_category_t force;
prompt - type drs_categories_t
drop type drs_categories_t force;
prompt - type drs_film_info_t
drop type drs_film_info_t force;
prompt - type drs_country_t
drop type drs_country_t force;
prompt - type drs_city_t
drop type drs_city_t force;
prompt - type drs_address_t
drop type drs_address_t force;
prompt - type drs_customer_t
drop type drs_customer_t force;
prompt - type drs_customers_t
drop type drs_customers_t force;
prompt - type drs_customer_rental_history_t
drop type drs_customer_rental_history_t force;

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
prompt - table drs_film_actor
drop table drs_film_actor cascade constraints purge;
prompt - table drs_film_category
drop table drs_film_category cascade constraints purge;
prompt - table drs_film_text
drop table drs_film_text cascade constraints purge;
prompt - table drs_film
drop table drs_film cascade constraints purge;
prompt - table drs_inventory
drop table drs_inventory cascade constraints purge;
prompt - table drs_language
drop table drs_language cascade constraints purge;
prompt - table drs_payment
drop table drs_payment cascade constraints purge;
prompt - table drs_rental
drop table drs_rental cascade constraints purge;
prompt - table drs_staff
drop table drs_staff cascade constraints purge;
prompt - table drs_store
drop table drs_store cascade constraints purge;
