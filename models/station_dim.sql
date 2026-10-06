WITH station_cte as (
    SELECT  
    distinct
    start_station_id,
    start_station_name,
    start_lat,
    start_lng
    FROM {{ source('my_source', 'bike') }}
    where ride_id <> 'ride_id'
    
)

select * from station_cte