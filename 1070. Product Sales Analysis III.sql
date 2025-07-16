select
  s.product_id,
  year as first_year,
  quantity,
  price
from
  Sales s
  join (
    select
      product_id,
      min(year) as first_year
    from
      Sales
    group by
      product_id
  ) as f on f.product_id = s.product_id
where
  f.first_year = s.year;