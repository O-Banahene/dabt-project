WITH trips AS (
    SELECT 
    ride_id,
    rideable_type,
    DATE(TO_TIMESTAMP(STARTED_AT)) AS trip_date,
    start_station_id,
    end_station_id,
    member_casual,
    TIMESTAMPDIFF('SECOND', TO_TIMESTAMP(STARTED_AT), TO_TIMESTAMP(ENDED_AT)) AS trip_duration
    FROM {{ source('my_source', 'bike') }}
    WHERE ride_id <> 'ride_id'
    limit 10
)
SELECT * from trips