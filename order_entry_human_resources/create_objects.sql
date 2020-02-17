prompt CREATE OBJECTS

@tables\oehr_countries.sql
@tables\oehr_customers.sql
@tables\oehr_departments.sql
@tables\oehr_employees.sql
@tables\oehr_inventories.sql
@tables\oehr_job_history.sql
@tables\oehr_jobs.sql
@tables\oehr_locations.sql
@tables\oehr_order_items.sql
@tables\oehr_orders.sql
@tables\oehr_product_descriptions.sql
@tables\oehr_product_information.sql
@tables\oehr_promotions.sql
@tables\oehr_regions.sql
@tables\oehr_warehouses.sql

prompt - indexes
rem foreign key indexes are created automatically with a script
create index oehr_temp_name_01_ix on oehr_customers            (cust_email);
create index oehr_temp_name_02_ix on oehr_customers            (cust_last_name);
create index oehr_temp_name_03_ix on oehr_customers            (upper(cust_last_name), upper(cust_first_name));
create index oehr_temp_name_04_ix on oehr_employees            (last_name, first_name);
create index oehr_temp_name_05_ix on oehr_inventories          (warehouse_id, product_id);
create index oehr_temp_name_06_ix on oehr_locations            (city);
create index oehr_temp_name_07_ix on oehr_locations            (state_province);
create index oehr_temp_name_08_ix on oehr_orders               (order_date);
create index oehr_temp_name_09_ix on oehr_product_descriptions (translated_name);
create index oehr_temp_name_10_ix on oehr_product_information  (supplier_id);

prompt - referential constraints
alter table oehr_countries            modify region_id      references oehr_regions;
alter table oehr_customers            modify account_mgr_id references oehr_employees;
alter table oehr_departments          modify location_id    references oehr_locations;
alter table oehr_departments          modify manager_id     references oehr_employees;
alter table oehr_employees            modify department_id  references oehr_departments;
alter table oehr_employees            modify job_id         references oehr_jobs;
alter table oehr_employees            modify manager_id     references oehr_employees;
alter table oehr_inventories          modify product_id     references oehr_product_information;
alter table oehr_inventories          modify warehouse_id   references oehr_warehouses;
alter table oehr_job_history          modify department_id  references oehr_departments;
alter table oehr_job_history          modify employee_id    references oehr_employees;
alter table oehr_job_history          modify job_id         references oehr_jobs;
alter table oehr_locations            modify country_id     references oehr_countries;
alter table oehr_order_items          modify order_id       references oehr_orders               on delete cascade;
alter table oehr_order_items          modify product_id     references oehr_product_information;
alter table oehr_orders               modify customer_id    references oehr_customers            on delete set null;
alter table oehr_orders               modify sales_rep_id   references oehr_employees            on delete set null;
alter table oehr_product_descriptions modify product_id     references oehr_product_information;
alter table oehr_warehouses           modify location_id    references oehr_locations            on delete set null;

@triggers/oehr_calc_line_item_id.sql
@triggers/oehr_update_job_history.sql

@views/oehr_emp_details_view.sql

@../_global_scripts/create_missing_fk_indexes.sql OEHR
@../_global_scripts/manage_constraint_names.sql OEHR
