prompt - view drs_sales_by_store_v

create or replace view drs_sales_by_store_v as
select
  s.store_id                         as store_id,
  c.city || ',' || cy.country        as store,
  m.first_name || ' ' || m.last_name as manager,
  sum(p.amount)                      as total_sales
from
  drs_payment        p
  join drs_rental    r  on p.rental_id        = r.rental_id
  join drs_inventory i  on r.inventory_id     = i.inventory_id
  join drs_store     s  on i.store_id         = s.store_id
  join drs_address   a  on s.address_id       = a.address_id
  join drs_city      c  on a.city_id          = c.city_id
  join drs_country   cy on c.country_id       = cy.country_id
  join drs_staff     m  on s.manager_staff_id = m.staff_id
group by
  s.store_id,
  c.city || ',' || cy.country,
  m.first_name || ' ' || m.last_name;
