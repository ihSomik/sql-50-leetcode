-- select d.name as Department, e.name as Employee, salary as Salary from Employee e
-- join 
-- Department d 
-- on e.departmentId=d.id
-- where salary in(
-- select distinct salary from Employee 
-- where e.departmentId=departmentId
-- order by salary desc
-- limit 3
-- );
-- Unfortunately, subqueries with LIMIT in IN clause are not allowed in standard SQL like MySQL, because they can't limit per group
select
  d.name as Department,
  e.name as Employee,
  salary as Salary
from
  Employee e
  join Department d on e.departmentId = d.id
where
  (
    -- for each employee, count how many distinct salaries in their department are higher than their salary.
    -- if that count is less than 3, it means their salary is in the top 3 unique salaries of their department.
    select
      count(distinct salary)
    from
      Employee
    where
      departmentId = e.departmentId
      and salary > e.salary
  ) < 3;