prompt - trigger drs_store_biu

create or replace trigger drs_store_biu
  before insert or update on drs_store for each row
begin
  :new.last_update := current_date;
end;
/