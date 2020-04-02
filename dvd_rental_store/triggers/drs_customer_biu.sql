prompt - trigger drs_customer_biu

create or replace trigger drs_customer_biu
  before insert or update on drs_customer for each row
begin
  if inserting then
    :new.create_date := current_date;
  end if;
  :new.last_update := current_date;
end;
/