/* Write your T-SQL query statement below */


with cummutotal as (
    select person_name, turn,person_id, weight, sum(weight)
        over( order by turn )
        as runningtotal
    from queue
)

select top 1 person_name
from cummutotal
where runningtotal <=1000
order by turn desc







