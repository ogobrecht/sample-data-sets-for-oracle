prompt - type drs_customer_rental_history_t

create or replace type drs_customer_rental_history_t as object (
  customer  drs_customer_t,
  films     drs_films_t
);
/