prompt - insert into drs_film 1000 rows
set define off feedback off

declare
type  r_t is table of drs_film%rowtype index by pls_integer;
r     r_t;
v_start pls_integer := dbms_utility.get_time;
begin
--
r(1).film_id := 100001;
r(1).title := 'ACADEMY DINOSAUR';
r(1).description := 'A Epic Drama of a Feminist And a Mad Scientist who must Battle a Teacher in The Canadian Rockies';
r(1).release_year := '2006';
r(1).language_id := 1;
r(1).original_language_id := null;
r(1).rental_duration := 6;
r(1).rental_rate := 0.99;
r(1).length := 86;
r(1).replacement_cost := 20.99;
r(1).rating := 'PG';
r(1).special_features := 'Deleted Scenes,Behind the Scenes';
r(1).last_update := current_date;
--
r(2).film_id := 100002;
r(2).title := 'ACADEMY DINOSAUR';
r(2).description := 'A Epic Drama of a Feminist And a Mad Scientist who must Battle a Teacher in The Canadian Rockies';
r(2).release_year := '2006';
r(2).language_id := 1;
r(2).original_language_id := null;
r(2).rental_duration := 6;
r(2).rental_rate := 0.99;
r(2).length := 86;
r(2).replacement_cost := 20.99;
r(2).rating := 'PG';
r(2).special_features := 'Deleted Scenes,Behind the Scenes';
r(2).last_update := current_date;
--
-- ...
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
                      ||(dbms_utility.get_time - v_start) / 100
                      || ' seconds');

end;
/

commit;