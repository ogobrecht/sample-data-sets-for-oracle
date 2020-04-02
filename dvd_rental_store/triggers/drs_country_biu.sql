prompt - trigger drs_country_biu

create or replace trigger drs_country_biu
  before insert or update on drs_country for each row
begin
  :new.last_update := current_date;
end;
/