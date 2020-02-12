prompt - trigger oehr_calc_line_item_id

create or replace trigger oehr_calc_line_item_id
  before insert on oehr_order_items
  for each row
declare
  new_line number;
begin
  if :new.line_item_id is null then
    select (nvl(max(line_item_id), 0) + 1)
      into new_line
      from oehr_order_items
     where order_id = :new.order_id;
    :new.line_item_id := new_line;
  end if;
end;
/
