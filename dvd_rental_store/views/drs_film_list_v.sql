prompt - view drs_film_list_v

create or replace view drs_film_list_v as
select
  f.film_id                          as fid,
  f.title                            as title,
  f.description                      as description,
  c.name                             as category,
  f.rental_rate                      as price,
  f.length                           as length,
  f.rating                           as rating,
  a.first_name || ' ' || a.last_name as actor
from
  drs_category                c
  left join drs_film_category fc on c.category_id = fc.category_id
  left join drs_film          f  on fc.film_id    = f.film_id
  join drs_film_actor         fa on f.film_id     = fa.film_id
  join drs_actor              a  on fa.actor_id   = a.actor_id;
