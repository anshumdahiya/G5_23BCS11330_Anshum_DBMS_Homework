-- Postgre
SELECT   machine_id ,round((sum(timestamp) Filter(where activity_type='end')-
sum(timestamp) Filter(where activity_type='start'))/count(*) filter(Where  activity_type='end') ,3) 
as Processing_Time
FROM Activity
group by machine_id 
order by machine_id;