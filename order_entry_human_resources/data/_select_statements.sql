-- the used select statements to produce the insert statements (with SQL Developer)
select /*insert*/ * from oehr_countries order by country_id;
select /*insert*/ * from oehr_customers order by cust_last_name, cust_first_name;
select /*insert*/ * from oehr_departments order by department_name;
select /*insert*/ * from oehr_employees order by last_name, first_name;
select /*insert*/ * from oehr_inventories order by warehouse_id, quantity_on_hand;
select /*insert*/ * from oehr_job_history order by end_date, start_date;
select /*insert*/ * from oehr_jobs order by min_salary desc, max_salary desc, job_title;
select /*insert*/ * from oehr_locations order by country_id, city;
select /*insert*/ * from oehr_order_items order by order_id, line_item_id;
select /*insert*/ * from oehr_orders order by order_id;
select /*insert*/ * from oehr_product_descriptions order by translated_name;
select /*insert*/ * from oehr_product_information order by product_name;
select /*insert*/ * from oehr_promotions order by promo_id;
select /*insert*/ * from oehr_regions order by region_id;
select /*insert*/ * from oehr_warehouses order by warehouse_id;

-- overall rows of data
select
  (select count(*) from oehr_countries) +            --   25
  (select count(*) from oehr_customers) +            --  319
  (select count(*) from oehr_departments) +          --   27
  (select count(*) from oehr_employees) +            --  107
  (select count(*) from oehr_inventories) +          -- 1112
  (select count(*) from oehr_job_history) +          --   10
  (select count(*) from oehr_jobs) +                 --   19
  (select count(*) from oehr_locations) +            --   23
  (select count(*) from oehr_order_items) +          --  664
  (select count(*) from oehr_orders) +               --  105
  (select count(*) from oehr_product_descriptions) + --  288
  (select count(*) from oehr_product_information) +  --  288
  (select count(*) from oehr_promotions) +           --    2
  (select count(*) from oehr_regions) +              --    4
  (select count(*) from oehr_warehouses)             --    9
  as sum_rows                                        -- 3002
from dual;