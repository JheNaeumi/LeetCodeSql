/* Write your T-SQL query statement below */
with count_maxrated as (
    select user_id, count(user_id) as maxcount
    from MovieRating
    group by user_id
),
get_maxrated as(
    select max(maxcount) as maxrated
    from count_maxrated 
),
Avgrating as (
    select movie_id, avg(convert(decimal(7,2) ,rating) ) as avrate
    from MovieRating
    where Month(created_at) = 2 and year(created_at) = '2020'
    group by movie_id
),
Highestrating as (
    select max(avrate) as maxrating
    from Avgrating
),
Resulta as (
    select top 1 c.name as results
    from count_maxrated a
    inner join get_maxrated b
    on a.maxcount = b.maxrated
    inner join Users c
    on a.user_id = c.user_id 
    order by c.name
),
Resultb as (
    select top 1 c.title as results
    from Avgrating a
    inner join Highestrating b
    on a.avrate = b.maxrating
    left join Movies c
    on a.movie_id = c.movie_id
    order by c.title
)



select results from Resulta 
Union all
select results from Resultb




