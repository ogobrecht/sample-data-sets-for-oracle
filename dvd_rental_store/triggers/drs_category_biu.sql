prompt - trigger drs_category_biu

create or replace trigger drs_category_biu
  before insert or update on drs_category for each row
begin
  :new.last_update := current_date;
end;
/