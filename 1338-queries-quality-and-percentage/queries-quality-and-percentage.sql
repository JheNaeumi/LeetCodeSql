/* Write your T-SQL query statement below */
select query_name , round(sum(rating/convert(decimal(7,2),position)) / count(*),2) as quality, round(sum(case when rating < 3 then 1 else 0 end) / convert(decimal(7,2), count(*)) * 100,2) as poor_query_percentage
from queries
where query_name is not null
group by query_name 