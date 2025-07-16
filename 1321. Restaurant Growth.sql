select
  visited_on,
  (
    select
      sum(amount)
    from
      Customer
    where
      visited_on between date_sub (c.visited_on, interval 6 day) and c.visited_on
  ) as amount,
  (
    select
      round(sum(amount) / 7, 2)
    from
      customer -- avg() won't work here because it divides by row count; we need to divide by 7 days always.
    where
      visited_on between date_sub (c.visited_on, interval 6 day) and c.visited_on
  ) as average_amount
from
  Customer c
where
  c.visited_on >= (
    select
      date_add (min(visited_on), interval 6 day)
    from
      Customer
  )
group by
  visited_on
order by
  visited_on;