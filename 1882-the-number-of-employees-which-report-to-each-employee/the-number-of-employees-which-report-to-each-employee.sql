/* Write your T-SQL query statement below */
select a.employee_id, a.name,count(b.reports_to) as reports_count, round(avg(convert(decimal (8,2),b.age)),0) as average_age
from employees a
inner join employees b
on  a.employee_id = b.reports_to
group by a.employee_id, a.name
order by a.employee_id
--where reports_to is null