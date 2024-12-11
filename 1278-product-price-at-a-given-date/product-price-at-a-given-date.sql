/* Write your T-SQL query statement below */

-- with temp as(
--     select distinct product_id, 
--     case 
--         when change_date <= '2019-08-16' then max(new_price)
--         else 10
--     end as price
--     from Products
--     group by product_id, change_date
-- )
-- select distinct a.product_id, max(b.price) as price
-- from Products a
-- inner join temp b
-- on a.product_id = b.product_id
-- group by a.product_id

--select change_date from Products where change_date <= '2019-08-16'

with get_maxdate as(
    select product_id, max(change_date) as max_date 
    from Products 
    where change_date <='2019-08-16' 
    group by product_id
),
get_overdate as(
    select product_id, max(change_date) as max_date
    from Products
    group by product_id
),
get_groupeddate as (
select b.product_id,
    case
        when a.max_date is not null then a.max_date
        else b.max_date
    end as final_date
from get_overdate b
left join get_maxdate a
on a.product_id = b.product_id
)

select a.product_id, 
    case 
        when b.final_date <= '2019-08-16' then a.new_price
        else 10
    end as price
from Products a
inner join get_groupeddate b
on a.product_id = b.product_id and a.change_date = b.final_date

-- select distinct a.product_id, a.new_price, b.max_date
-- from Products a
-- left join get_maxdate b
-- on a.product_id = b.product_id and a.change_date = b.max_date
