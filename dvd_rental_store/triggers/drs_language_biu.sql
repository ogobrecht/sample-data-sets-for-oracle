prompt - trigger drs_language_biu

create or replace trigger drs_language_biu
  before insert or update on drs_language for each row
begin
  :new.last_update := current_date;
end;
/