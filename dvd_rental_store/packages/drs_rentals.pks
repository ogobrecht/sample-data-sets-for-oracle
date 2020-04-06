prompt - package spec drs_rentals

create or replace package drs_rentals as
  function get_actor (p_actor_id integer)
    return drs_actor_t;

  function get_actors
    return drs_actors_t;

  function get_customer (p_customer_id integer)
    return drs_customer_t;

  function get_customers
    return drs_customers_t;

  function get_film (p_film_id integer)
    return drs_film_t;

  function get_films
    return drs_films_t;

  function get_customer_rental_history (p_customer_id integer)
    return drs_customer_rental_history_t;

  function get_customer_rental_history (p_customer drs_customer_t)
    return drs_customer_rental_history_t;

  function get_film_info (p_film_id integer)
    return drs_film_info_t;

  function get_film_info (p_film drs_film_t)
    return drs_film_info_t;

end drs_rentals;
/