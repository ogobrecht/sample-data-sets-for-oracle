create or replace package body rentals as

  function get_actor (p_actor_id integer)
    return drs_actor_t
  is
    v_result drs_actor_t;
  begin
    select
      drs_actor_t(a.actor_id, a.first_name, a.last_name, a.last_update)
    into v_result
    from
      actor a
    where
      a.actor_id = p_actor_id;

    return v_result;
  end get_actor;

  function get_actors
    return drs_actors_t
  is
    v_result drs_actors_t;
  begin
    select
      drs_actor_t(a.actor_id, a.first_name, a.last_name, a.last_update)
    bulk collect
    into v_result
    from
      actor a;

    return v_result;
  end get_actors;

  function get_customer (p_customer_id integer)
    return drs_customer_t
  is
    v_result drs_customer_t;
  begin
    select
      drs_customer_t(
        c.customer_id,
        c.first_name,
        c.last_name,
        c.email,
        drs_address_t(
          a.address_id,
          a.address,
          a.address2,
          a.district,
          drs_city_t(
            i.city_id,
            i.city,
            drs_country_t(
              o.country_id,
              o.country,
              o.last_update),
            i.last_update),
          a.postal_code,
          a.phone,
          a.last_update),
      c.active,
      c.create_date,
      c.last_update)
    into v_result
    from
      customer          c
      left join address a on c.address_id = a.address_id
      left join city    i on a.city_id    = i.city_id
      left join country o on i.country_id = o.country_id
    where
      c.customer_id = p_customer_id;

    return v_result;
  end get_customer;

  function get_customers
    return drs_customers_t
  is
    v_result drs_customers_t;
  begin
    select
      drs_customer_t(
        c.customer_id,
        c.first_name,
        c.last_name,
        c.email,
        drs_address_t(
          a.address_id,
          a.address,
          a.address2,
          a.district,
          drs_city_t(
            i.city_id,
            i.city,
            drs_country_t(
              o.country_id,
              o.country,
              o.last_update),
            i.last_update),
          a.postal_code,
          a.phone,
          a.last_update),
        c.active,
        c.create_date,
        c.last_update)
    bulk collect
    into v_result
    from
      customer          c
      left join address a on c.address_id = a.address_id
      left join city    i on a.city_id    = i.city_id
      left join country o on i.country_id = o.country_id;

    return v_result;
  end get_customers;

  function get_film (p_film_id integer)
    return drs_film_t
  is
    v_result drs_film_t;
  begin
    select
      drs_film_t(
        f.film_id,
        f.title,
        f.description,
        f.release_year,
        nvl2(l1.language_id, drs_language_t(l1.language_id, l1.name, l1.last_update), null),
        nvl2(l2.language_id, drs_language_t(l2.language_id, l2.name, l2.last_update), null),
        f.rental_duration,
        f.rental_rate,
        f.length,
        f.replacement_cost,
        f.rating,
        f.special_features,
        f.last_update)
    into v_result
    from
      film               f
      left join language l1 on f.language_id          = l1.language_id
      left join language l2 on f.original_language_id = l2.language_id
    where
      f.film_id = p_film_id;

    return v_result;
  end get_film;

  function get_films
    return drs_films_t
  is
    v_result drs_films_t;
  begin
    select
      drs_film_t(
        f.film_id,
        f.title,
        f.description,
        f.release_year,
        nvl2(l1.language_id, drs_language_t(l1.language_id, l1.name, l1.last_update), null),
        nvl2(l2.language_id, drs_language_t(l2.language_id, l2.name, l2.last_update), null),
        f.rental_duration,
        f.rental_rate,
        f.length,
        f.replacement_cost,
        f.rating,
        f.special_features,
        f.last_update)
    bulk collect
    into v_result
    from
      film               f
      left join language l1 on f.language_id          = l1.language_id
      left join language l2 on f.original_language_id = l2.language_id;

    return v_result;
  end get_films;

  function get_customer_rental_history (p_customer_id integer)
    return drs_customer_rental_history_t
  is
  begin
    return get_customer_rental_history(get_customer(p_customer_id));
  end get_customer_rental_history;

  function get_customer_rental_history (p_customer drs_customer_t)
    return drs_customer_rental_history_t
  is
    v_films drs_films_t;
  begin
    select
      get_film(f.film_id)
    bulk collect
    into v_films
    from
      (
        select distinct
          f.film_id
        from
          film                f
          left join inventory i on i.film_id      = f.film_id
          left join rental    r on r.inventory_id = i.inventory_id
        where
          r.customer_id = p_customer.customer_id
      ) f
    order by
      f.film_id;

    return drs_customer_rental_history_t(p_customer, v_films);
  end get_customer_rental_history;

  function get_film_info (p_film_id integer)
    return drs_film_info_t
  is
  begin
    return get_film_info(get_film(p_film_id));
  end get_film_info;

  function get_film_info (p_film drs_film_t)
    return drs_film_info_t
  is
    v_actors     drs_actors_t;
    v_categories drs_categories_t;
  begin
    select
      drs_actor_t(
        a.actor_id,
        a.first_name,
        a.last_name,
        a.last_update)
    bulk collect
    into v_actors
    from
           actor      a
      join film_actor fa on fa.actor_id = a.actor_id
    where
      fa.film_id = p_film.film_id
    order by
      a.actor_id;

    select
      drs_category_t(
        c.category_id,
        c.name,
        c.last_update)
    bulk collect
    into v_categories
    from
           category      c
      join film_category fc on fc.category_id = c.category_id
    where
      fc.film_id = p_film.film_id
    order by
      c.category_id;

    return drs_film_info_t(p_film, v_actors, v_categories);
  end get_film_info;

end rentals;
/