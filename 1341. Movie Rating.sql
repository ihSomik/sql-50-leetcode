(
  select
    u.name as results
  from
    MovieRating r
    join Users u on u.user_id = r.user_id
  group by
    r.user_id
  order by
    count(r.user_id) desc,
    u.name
  limit
    1
)
union all -- same name of user and  movie
(
  select
    m.title
  from
    Movies m
    join MovieRating r on m.movie_id = r.movie_id
  where
    created_at between '2020-02-01' and '2020-02-29'
  group by
    r.movie_id
  order by
    avg(rating) desc,
    m.title
  limit
    1
);