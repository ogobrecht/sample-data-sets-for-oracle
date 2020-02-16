prompt DROP OBJECTS

@../_global_scripts/disable_all_foreign_key_constraints.sql OEHR

prompt - view oehr_emp_details_view
drop view oehr_emp_details_view;
prompt - table oehr_countries
drop table oehr_countries cascade constraints purge;
prompt - table oehr_customers
drop table oehr_customers cascade constraints purge;
prompt - table oehr_departments
drop table oehr_departments cascade constraints purge;
prompt - table oehr_employees
drop table oehr_employees cascade constraints purge;
prompt - table oehr_inventories
drop table oehr_inventories cascade constraints purge;
prompt - table oehr_job_history
drop table oehr_job_history cascade constraints purge;
prompt - table oehr_jobs
drop table oehr_jobs cascade constraints purge;
prompt - table oehr_locations
drop table oehr_locations cascade constraints purge;
prompt - table oehr_order_items
drop table oehr_order_items cascade constraints purge;
prompt - table oehr_orders
drop table oehr_orders cascade constraints purge;
prompt - table oehr_product_descriptions
drop table oehr_product_descriptions cascade constraints purge;
prompt - table oehr_product_information
drop table oehr_product_information cascade constraints purge;
prompt - table oehr_promotions
drop table oehr_promotions cascade constraints purge;
prompt - table oehr_regions
drop table oehr_regions cascade constraints purge;
prompt - table oehr_warehouses
drop table oehr_warehouses cascade constraints purge;