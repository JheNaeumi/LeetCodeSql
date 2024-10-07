/* Write your T-SQL query statement below */
-- select s.product_id, min(s.year) as first_year
-- from sales s
-- left join product p
-- on s.product_id = p.product_id
-- group by s.product_id
with minYear as (
    select s.product_id,min(s.year) as fyear
    from sales s
    group by s.product_id
),
groupProd as (
    select s.product_id ,s.year, s.quantity, s.price
    from sales s
    left join product p
    on s.product_id = p.product_id
)
select s.product_id, s.year as first_year, s.quantity, s.price
from minYear m
left join groupProd s
on m.fyear = s.year and m.product_id = s.product_id