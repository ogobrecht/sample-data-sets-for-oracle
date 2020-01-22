prompt - view co_product_reviews

create or replace view co_product_reviews as
  select
    p.product_name,
    r.rating,
    round(avg(r.rating) over(partition by product_name), 2) avg_rating,
    r.review
  from
    co_products p,
    json_table (p.product_details, '$' 
      columns (nested path '$.reviews[*]' 
        columns (
          rating integer path '$.rating',
          review varchar2(4000) path '$.review'))) r;

comment on table co_product_reviews
  is 'A relational view of the reviews stored in the JSON for each product';

comment on column co_product_reviews.product_name 
  is 'What this product is called';

comment on column co_product_reviews.rating 
  is 'The review score the customer has placed. Range is 1-10';

comment on column co_product_reviews.avg_rating 
  is 'The mean of the review scores for this product';

comment on column co_product_reviews.review 
  is 'The text of the review';