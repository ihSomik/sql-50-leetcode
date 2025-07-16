select
  contest_id,
  round(
    count(distinct r.user_id) * 100.0 / (
      select
        count(*)
      from
        Users
    ),
    2
  ) as percentage
from
  Register r
  join Users u on u.user_id = r.user_id
group by
  contest_id
order by
  percentage desc,
  contest_id;