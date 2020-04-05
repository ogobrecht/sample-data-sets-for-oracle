prompt - view drs_customer_list_v

create or replace view drs_customer_list_v as
select
  cu.customer_id                       as id,
  cu.first_name || ' ' || cu.last_name as name,
  a.address                            as address,
  a.postal_code                        as zip_code,
  a.phone                              as phone,
  ci.city                              as city,
  co.country                           as country,
  decode(cu.active, 1, 'active', '')   as notes,
  cu.store_id                          as sid
from
  drs_customer     cu
  join drs_address a  on cu.address_id = a.address_id
  join drs_city    ci on a.city_id    = ci.city_id
  join drs_country co on ci.country_id = co.country_id;
