/* Write your T-SQL query statement below */
with product_count as (
    select count(product_key) as allcount
    from product
) 
select c.customer_id
from customer c
 group by c.customer_id
 having count(distinct c.product_key) =  (select allcount from product_count)
 order by c.customer_id
