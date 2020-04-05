prompt - trigger drs_inventory_biu

create or replace trigger drs_inventory_biu
  before insert or update on drs_inventory for each row
begin
  :new.last_update := current_date;
end;
/