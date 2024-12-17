/* Write your T-SQL query statement below */
with groupeddate as (
    select visited_on, sum(amount) as daily_amount
    from customer
    group by visited_on
),
avgAmm as (
    select visited_on, 
        sum(daily_amount) over (order by visited_on rows between 6 preceding and current row) sum_amm,
        round(avg(convert(decimal(7,2), daily_amount)) over (order by visited_on ROWS BETWEEN 6         PRECEDING AND CURRENT ROW),2) as cum_amm,
        ROW_NUMBER() OVER (ORDER BY visited_on) AS rn
    from groupeddate
)
select visited_on, sum_amm as amount, cum_amm as average_amount
from avgAmm
where rn >= 7 



