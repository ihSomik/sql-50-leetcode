select
  pi.product_id,
  coalesce(pr.new_price, 10) as price
from
  (
    select distinct
      product_id
    from
      Products
  ) pi
  left join -- as some products change_date > '2019-08-16', so their price will be NULL
  Products pr on pi.product_id = pr.product_id
  and pr.change_date = (
    select
      max(change_date)
    from
      Products
    where
      pr.product_id = product_id
      and change_date <= '2019-08-16'
  );