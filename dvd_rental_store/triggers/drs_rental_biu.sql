prompt - trigger drs_rental_biu

create or replace trigger drs_rental_biu
  before insert or update on drs_rental for each row
begin
  :new.last_update := current_date;
end;
/