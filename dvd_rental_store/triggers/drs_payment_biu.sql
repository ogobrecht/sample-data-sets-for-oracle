prompt - trigger drs_payment_biu

create or replace trigger drs_payment_biu
  before insert or update on drs_payment for each row
begin
  :new.last_update := current_date;
end;
/