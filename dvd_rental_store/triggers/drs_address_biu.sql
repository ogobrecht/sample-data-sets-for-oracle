prompt - trigger drs_address_biu

create or replace trigger drs_address_biu
  before insert or update on drs_address for each row
begin
  :new.last_update := current_date;
end;
/