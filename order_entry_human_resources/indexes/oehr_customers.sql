prompt - indexes on oehr_customers

create index oehr_cust_account_manager_ix on oehr_customers (account_mgr_id);
create index oehr_cust_email_ix           on oehr_customers (cust_email);
create index oehr_cust_lname_ix           on oehr_customers (cust_last_name);
create index oehr_cust_upper_name_ix      on oehr_customers (upper(cust_last_name), upper(cust_first_name));
create index oehr_count_region_ix         on oehr_countries (region_id);