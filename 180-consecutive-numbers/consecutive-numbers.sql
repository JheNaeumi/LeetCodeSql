/* Write your T-SQL query statement below */

select distinct a.num as consecutiveNums
from logs a
inner join logs b
on a.id = b.id-1
inner join logs c
on b.id = c.id-1 
where a.num = b.num and b.num = c.num
