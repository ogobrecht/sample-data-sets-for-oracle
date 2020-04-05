prompt - view drs_staff_list_v

create or replace view drs_staff_list_v as
select
  s.staff_id                         as id,
  s.first_name || ' ' || s.last_name as name,
  a.address                          as address,
  a.postal_code                      as zip_code,
  a.phone                            as phone,
  ci.city                            as city,
  co.country                         as country,
  s.store_id                         as sid
from
  drs_staff        s
  join drs_address a  on s.address_id  = a.address_id
  join drs_city    ci on a.city_id     = ci.city_id
  join drs_country co on ci.country_id = co.country_id;
