/* Write your T-SQL query statement below */
select a.employee_id
, a.department_id
from employee a
inner join employee b
on a.employee_id = b.employee_id
-- where a.primary_flag = 'Y'
group by a.employee_id
, a.department_id, a.primary_flag
having (count(a.primary_flag) =1 or a.primary_flag = 'Y') 
