prompt - trigger drs_staff_biu

create or replace trigger drs_staff_biu
  before insert or update on drs_staff for each row
begin
  :new.last_update := current_date;
end;
/