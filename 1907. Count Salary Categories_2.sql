select
  'Low Salary' as category,
  count(if (income < 20000, 1, null)) as accounts_count
from
  Accounts
union
select
  'Average Salary',
  count(if (income between 20000 and 50000, 1, null))
from
  Accounts
union
select
  'High Salary',
  count(if (income > 50000, 1, null))
from
  Accounts;