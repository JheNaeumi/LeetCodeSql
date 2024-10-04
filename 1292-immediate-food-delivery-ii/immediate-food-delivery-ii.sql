/* Write your T-SQL query statement below */
with firstOrder as (
    select customer_id, min(order_date) as firstOrderDate
    from delivery
    group by customer_id
), 
immediateOrders as (
    select d.customer_id as orders
    from delivery d 
    group by d.customer_id
    having(min(d.order_date) = min(d.customer_pref_delivery_date))
)
select round(count( i.orders)/convert(decimal(7,2) ,count(f.customer_id)) * 100,2) as immediate_percentage 
from  firstOrder f
left join immediateOrders i
on f.customer_id = i.orders

