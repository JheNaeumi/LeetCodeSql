/* Write your T-SQL query statement below */
select user_id, sum(case when follower_id != user_id then 1 else 0 end) as followers_count
from followers
group by user_id