prompt - trigger drs_actor_biu

create or replace trigger drs_actor_biu
  before insert or update on drs_actor for each row
begin
  :new.last_update := current_date;
end;
/