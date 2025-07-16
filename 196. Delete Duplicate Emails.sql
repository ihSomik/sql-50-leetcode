-- delete from Person
-- where id not in(
--     select min(id) from Person
--     group by email
-- );
-- runtime error! You can't specify target table 'Person' for update in FROM clause.
delete p
from
  Person p
  join Person q on p.email = q.email
  and p.id > q.id;