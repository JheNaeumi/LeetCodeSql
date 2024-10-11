/* Write your T-SQL query statement below */
with distinctnum as (
select num as uniquenum
from mynumbers
group by num
having count(num) = 1
)

select max(uniquenum) as num
from distinctnum
