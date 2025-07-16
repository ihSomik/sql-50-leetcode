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
  left join (
    select
      product_id,
      new_price,
      change_date
    from
      Products
    where
      (product_id, change_date) in (
        select
          product_id,
          max(change_date) as change_date
        from
          Products
        where
          change_date <= '2019-08-16'
        group by
          product_id
      )
  ) as pr on pi.product_id = pr.product_id;