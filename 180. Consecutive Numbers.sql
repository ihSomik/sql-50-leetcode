select distinct
  l.num as ConsecutiveNums
from
  Logs l
  join Logs m on l.id + 1 = m.id
  join Logs n on m.id + 1 = n.id
where
  l.num = m.num
  and m.num = n.num;