/* Write your T-SQL query statement below */
with cte as (
    select count(*) as total
    from users
)
select r.contest_id, round(count(r.user_id)/cast(cte.total as float) * 100,2) as percentage
from users u
right join register r
on r.user_id = u.user_id
cross join cte
group by r.contest_id, cte.total
order by percentage desc, r.contest_id