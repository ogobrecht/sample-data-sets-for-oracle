prompt LOAD DATA

@data/oehr_countries.sql
@data/oehr_customers.sql
@data/oehr_departments.sql
@data/oehr_employees.sql
@data/oehr_inventories.sql
@data/oehr_job_history.sql
@data/oehr_jobs.sql
@data/oehr_locations.sql
@data/oehr_order_items.sql
@data/oehr_orders.sql
@data/oehr_product_descriptions.sql
@data/oehr_product_information.sql
@data/oehr_promotions.sql
@data/oehr_regions.sql
@data/oehr_warehouses.sql

@../_global_scripts/enable_foreign_key_constraints.sql "{ table_filter: 'OEHR_%', dry_run: false }"
@../_global_scripts/sync_sequence_values_to_data.sql   "{ table_filter: 'OEHR_%', dry_run: false }"
