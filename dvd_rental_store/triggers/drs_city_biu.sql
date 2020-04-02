prompt - trigger drs_city_biu

create or replace trigger drs_city_biu
  before insert or update on drs_city for each row
begin
  :new.last_update := current_date;
end;
/