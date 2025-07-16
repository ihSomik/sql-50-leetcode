select
  round(
    count(a.player_id) / (
      select
        count(distinct player_id)
      from
        Activity
    ),
    2
  ) as fraction
from
  Activity a
  join (
    select
      player_id,
      min(event_date) as first_day
    from
      Activity
    group by
      player_id
  ) f on a.player_id = f.player_id
where
  a.event_date = date_add (f.first_day, interval 1 day);