prompt - insert into drs_film 1000 rows
set define off feedback off

declare
type  drs_film_tab is table of drs_film%rowtype index by pls_integer;
r     drs_film_tab;
start pls_integer := dbms_utility.get_time;
begin
--

--
forall i in 1..r.count
  insert into drs_film (
    film_id,
    title,
    description,
    release_year,
    language_id,
    original_language_id,
    rental_duration,
    rental_rate,
    length,
    replacement_cost,
    rating,
    special_features,
    last_update
  ) values (
    r(i).film_id,
    r(i).title,
    r(i).description,
    r(i).release_year,
    r(i).language_id,
    r(i).original_language_id,
    r(i).rental_duration,
    r(i).rental_rate,
    r(i).length,
    r(i).replacement_cost,
    r(i).rating,
    r(i).special_features,
    r(i).last_update
  );

dbms_output.put_line('- '
                      ||(dbms_utility.get_time - start) / 100
                      || ' seconds');

end;
/

commit;