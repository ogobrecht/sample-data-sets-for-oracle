prompt - view drs_actor_info_v

create view drs_actor_info_v as
select
  a.actor_id,
  a.first_name,
  a.last_name,
  --fixme group concat in mysql? (was the original implementation)
  --listagg should deliver something like category one: film title, film title; category two: film title, film title;
group_concat(distinct concat(c.name, ': ', (
    select
        group_concat(f.title order by f.title separator ', ')
    from
      drs_film f
      join drs_film_category fc on f.film_id = fc.film_id
      join drs_film_actor fa    on f.film_id = fa.film_id
    where
      fc.category_id  = c.category_id
      and fa.actor_id = a.actor_id)
    )
  order by c.name separator '; '
) as drs_film_info
from
  drs_actor                   a
  left join drs_film_actor    fa on a.actor_id     = fa.actor_id
  left join drs_film_category fc on fa.film_id     = fc.film_id
  left join drs_category      c  on fc.category_id = c.category_id
group by
  a.actor_id,
  a.first_name,
  a.last_name;