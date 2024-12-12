/* Write your T-SQL query statement below */
WITH Categories AS (
    SELECT 'Low Salary' AS category
    UNION ALL
    SELECT 'Average Salary'
    UNION ALL
    SELECT 'High Salary'
),
cat as (
    select 
        case 
            when income < 20000 then 'Low Salary'
            when income >= 20000 and income <= 50000 then 'Average Salary'
            else 'High Salary'
        end as category,
        account_id
    from accounts
)


select a.category, count(b.account_id) as accounts_count
from Categories a
left join cat b
on a.category = b.category
group by a.category