/* Write your T-SQL query statement below */

select a.employee_id
from Employees a
where a.manager_id not in (
    select b.employee_id
    from employees b
)
and a.salary < 30000
order by a.employee_id asc
