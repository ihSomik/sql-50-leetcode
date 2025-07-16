select
  DATE_FORMAT (trans_date, '%Y-%m') as month,
  country,
  count(*) as trans_count,
  sum(state = 'approved') as approved_count,
  sum(amount) as trans_total_amount,
  sum(amount * (state = 'approved')) as approved_total_amount
from
  Transactions
group by
  DATE_FORMAT (trans_date, '%Y-%m'),
  country;