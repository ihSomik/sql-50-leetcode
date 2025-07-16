select
  person_name
from
  (
    select
      person_name,
      sum(weight) over (
        order by
          turn
      ) as cumulative_sum
    from
      Queue
  ) as t
where
  cumulative_sum <= 1000
order by
  cumulative_sum desc
limit
  1;