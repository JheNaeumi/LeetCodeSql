/* Write your T-SQL query statement below */
with ResultA as (
select top 1 d.name as results
from (
    select max(maxcount) as highestcount
    from (
        select user_id, count(user_id) as maxcount
        from MovieRating
        group by user_id
        ) as A
    ) as B
inner join (
    select user_id, count(user_id) as maxcount
    from MovieRating
    group by user_id
) as C
    on B.highestcount = c.maxcount
    inner join Users D
    on c.user_id = d.user_id
    order by d.name
),
ResultB as (
select top 1 D.title as results
from (
    select max(avr_rate) as max_rating
    from (
        select movie_id, avg(convert(decimal(7,2), rating)) as avr_rate 
        from MovieRating
        where Month(created_at) = 2 and year(created_at) = '2020'
        group by movie_id
    ) as A
) as B
inner join (
        select movie_id, avg(convert(decimal(7,2), rating)) as avr_rate 
        from MovieRating
        where Month(created_at) = 2 and year(created_at) = '2020'
        group by movie_id
) as C
    on C.avr_rate = B.max_rating
    inner join Movies as D
    on C.movie_id = D.movie_id
    order by D.title
)
Select results from ResultA
Union All
Select results from ResultB
-- with count_maxrated as (
--     select user_id, count(user_id) as maxcount
--     from MovieRating
--     group by user_id
-- ),
-- get_maxrated as(
--     select max(maxcount) as maxrated
--     from count_maxrated 
-- ),
-- Avgrating as (
--     select movie_id, avg(convert(decimal(7,2) ,rating) ) as avrate
--     from MovieRating
--     where Month(created_at) = 2 and year(created_at) = '2020'
--     group by movie_id
-- ),
-- Highestrating as (
--     select max(avrate) as maxrating
--     from Avgrating
-- ),
-- Resulta as (
--     select top 1 c.name as results
--     from count_maxrated a
--     inner join get_maxrated b
--     on a.maxcount = b.maxrated
--     inner join Users c
--     on a.user_id = c.user_id 
--     order by c.name
-- ),
-- Resultb as (
--     select top 1 c.title as results
--     from Avgrating a
--     inner join Highestrating b
--     on a.avrate = b.maxrating
--     left join Movies c
--     on a.movie_id = c.movie_id
--     order by c.title
-- )



-- select results from Resulta 
-- Union all
-- select results from Resultb




