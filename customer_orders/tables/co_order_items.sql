prompt - table co_order_items

create table co_order_items (
  order_id     integer      ,
  line_item_id integer      ,
  product_id   integer      not null,
  unit_price   number(10,2) not null,
  quantity     integer      not null,
  --
  primary key  (order_id, line_item_id),
  unique       (product_id, order_id)
);

comment on table co_order_items is
  'Details of which products the customer has purchased in an order';

comment on column co_order_items.order_id is
  'The order these products belong to';

comment on column co_order_items.line_item_id is
  'An incrementing number, starting at one for each order';

comment on column co_order_items.product_id is
  'Which item was purchased';

comment on column co_order_items.unit_price is
  'How much the customer paid for one item of the product';

comment on column co_order_items.quantity is
  'How many items of this product the customer purchased';