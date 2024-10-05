with firstlogin as(
    select player_id, min(event_date)as firstlog
    from activity
    group by player_id

),
consecutive as (
    select a.player_id
    from firstlogin f
    join activity  a
    on datediff(day,f.firstlog , a.event_date) = 1 
    and f.player_id = a.player_id
)

select round(count(c.player_id) / convert(decimal(7,2),count(f.player_id)) , 2) as fraction
from consecutive c
full outer join firstlogin f
on c.player_id = f.player_id
