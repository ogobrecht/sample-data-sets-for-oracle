@../_global_scripts/disable_foreign_key_constraints.sql '{ table_prefix: "OEHR", dry_run: false }'

prompt REMOVE DATA

prompt - truncate table oehr_countries
truncate table oehr_countries;
prompt - truncate table oehr_customers
truncate table oehr_customers;
prompt - truncate table oehr_departments
truncate table oehr_departments;
prompt - truncate table oehr_employees
truncate table oehr_employees;
prompt - truncate table oehr_inventories
truncate table oehr_inventories;
prompt - truncate table oehr_job_history
truncate table oehr_job_history;
prompt - truncate table oehr_jobs
truncate table oehr_jobs;
prompt - truncate table oehr_locations
truncate table oehr_locations;
prompt - truncate table oehr_order_items
truncate table oehr_order_items;
prompt - truncate table oehr_orders
truncate table oehr_orders;
prompt - truncate table oehr_product_descriptions
truncate table oehr_product_descriptions;
prompt - truncate table oehr_product_information
truncate table oehr_product_information;
prompt - truncate table oehr_promotions
truncate table oehr_promotions;
prompt - truncate table oehr_regions
truncate table oehr_regions;
prompt - truncate table oehr_warehouses
truncate table oehr_warehouses;
