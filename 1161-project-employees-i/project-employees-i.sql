# Write your MySQL query statement below
/* Write your T-SQL query statement below */
select a.project_id, round(cast(avg(b.experience_years)as float),2) as average_years
from project a
left join employee b
on a.employee_id = b.employee_id
group by a.project_id
order by a.project_id
