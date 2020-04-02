prompt - trigger drs_film_biu

create or replace trigger drs_film_biu
  before insert or update on drs_film for each row
begin
  :new.last_update := current_date;
end;
/