-- the used select statements to produce the insert statements (with SQL Developer)
select /*insert*/ * from drs_actor         order by actor_id;
select /*insert*/ * from drs_address       order by address_id;
select /*insert*/ * from drs_category      order by category_id;
select /*insert*/ * from drs_city          order by city_id;
select /*insert*/ * from drs_country       order by country_id;
select /*insert*/ * from drs_customer      order by customer_id;
select /*insert*/ * from drs_film_actor    order by actor_id, film_id;
select /*insert*/ * from drs_film_category order by film_id, category_id;
select /*insert*/ * from drs_film          order by film_id;
select /*insert*/ * from drs_inventory     order by inventory_id;
select /*insert*/ * from drs_language      order by language_id;
select /*insert*/ * from drs_payment       order by payment_id;
select /*insert*/ * from drs_rental        order by rental_id;
select /*insert*/ * from drs_staff         order by staff_id;
select /*insert*/ * from drs_store         order by store_id;

-- overall rows of data
select
  (select count(*) from drs_actor)         + --   200
  (select count(*) from drs_address)       + --   603
  (select count(*) from drs_category)      + --    16
  (select count(*) from drs_city)          + --   600
  (select count(*) from drs_country)       + --   109
  (select count(*) from drs_customer)      + --   599
  (select count(*) from drs_film_actor)    + --  5462
  (select count(*) from drs_film_category) + --  1000
  (select count(*) from drs_film_text)     + --     0
  (select count(*) from drs_film)          + --  1000
  (select count(*) from drs_inventory)     + --  4581
  (select count(*) from drs_language)      + --     6
  (select count(*) from drs_payment)       + -- 16049
  (select count(*) from drs_rental)        + -- 16044
  (select count(*) from drs_staff)         + --     2
  (select count(*) from drs_store)           --     2
  as sum_rows                                -- 46273
from dual;
