prompt CREATE OBJECTS

-- There is one simple rule: if the statement fits (readable) in one line of code
-- then write it direct here, otherwise create a script file for it.

@tables/drs_actor.sql
@tables/drs_address.sql
@tables/drs_category.sql
@tables/drs_city.sql
@tables/drs_country.sql
@tables/drs_customer.sql
@tables/drs_film_actor.sql
@tables/drs_film_category.sql
@tables/drs_film.sql
@tables/drs_inventory.sql
@tables/drs_language.sql
@tables/drs_payment.sql
@tables/drs_rental.sql
@tables/drs_staff.sql
@tables/drs_store.sql

@triggers/drs_actor_biu.sql
@triggers/drs_address_biu.sql
@triggers/drs_category_biu.sql
@triggers/drs_city_biu.sql
@triggers/drs_country_biu.sql
@triggers/drs_customer_biu.sql
@triggers/drs_film_actor_biu.sql
@triggers/drs_film_category_biu.sql
@triggers/drs_film_biu.sql
@triggers/drs_inventory_biu.sql
@triggers/drs_language_biu.sql
@triggers/drs_payment_biu.sql
@triggers/drs_rental_biu.sql
@triggers/drs_staff_biu.sql
@triggers/drs_store_biu.sql

prompt - 3 indexes (fk indexes are created later automatically)
create index drs_temp_name_01_ix on drs_actor     (last_name);
create index drs_temp_name_02_ix on drs_customer  (last_name);
create index drs_temp_name_03_ix on drs_inventory (store_id, film_id);

@types/drs_language(s)_t.sql
@types/drs_film(s)_t.sql
@types/drs_actor(s)_t.sql
@types/drs_category(s)_t.sql
@types/drs_film_info_t.sql
@types/drs_country_t.sql
@types/drs_city_t.sql
@types/drs_address_t.sql
@types/drs_customer(s)_t.sql
@types/drs_customer_rental_history_t.sql

--@views/drs_actor_info_v.sql
@views/drs_customer_list_v.sql
@views/drs_film_list_v.sql
@views/drs_sales_by_store_v.sql
@views/drs_sales_by_film_category_v.sql
@views/drs_staff_list_v.sql

@packages/drs_customers.pks
@packages/drs_rentals.pks

@packages/drs_customers.pkb
@packages/drs_rentals.pkb

@../_global_scripts/create_missing_foreign_keys.sql        "table_prefix=drs  dry_run=false  disable=true  on_delete_set_null_list=drs_payment:rental_id:drs_rental"
@../_global_scripts/create_missing_foreign_key_indexes.sql "table_prefix=drs  dry_run=false"
@../_global_scripts/unify_index_names.sql                  "table_prefix=drs  dry_run=false"
@../_global_scripts/unify_constraint_names.sql             "table_prefix=drs  dry_run=false"



@../_global_scripts/create_missing_foreign_keys.sql        "table_prefix=drs  dry_run=true  disable=true  on_delete_set_null_list=drs_payment:rental_id:drs_rental"
