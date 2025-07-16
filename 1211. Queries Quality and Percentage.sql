select
  query_name,
  round(avg(rating * 1.0 / position), 2) as quality,
  round(avg((rating < 3) * 1.0) * 100, 2) as poor_query_percentage
from
  Queries
group by
  query_name;