prompt - view drs_sales_by_film_category_v

-- Note that total sales will add up to > 100% because
-- some titles belong to more than 1 category.

create or replace view drs_sales_by_film_category_v as
select
  c.name        as category,
  sum(p.amount) as total_sales
from
  drs_payment            p
  join drs_rental        r  on p.rental_id    = r.rental_id
  join drs_inventory     i  on r.inventory_id = i.inventory_id
  join drs_film          f  on i.film_id      = f.film_id
  join drs_film_category fc on f.film_id      = fc.film_id
  join drs_category      c  on fc.category_id = c.category_id
group by
  c.name;
