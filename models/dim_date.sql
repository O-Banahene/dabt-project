WITH source_cte AS (
    SELECT
        TO_TIMESTAMP(STARTED_AT) AS STARTED_AT
    FROM {{ source('my_source', 'bike') }}
),

date_cte AS (
    SELECT
        STARTED_AT,
        TO_DATE(STARTED_AT) AS DATE_STARTED_AT,
        HOUR(STARTED_AT) AS HOUR_STARTED_AT,
        CASE
            WHEN DAYNAME(STARTED_AT) IN ('Sun', 'Sat')
                THEN 'WEEKEND'
            ELSE 'BUSINESSDAY'
        END AS DAY_TYPE,
        {{function1('STARTED_AT')}} AS STATION_OF_YEAR
    FROM source_cte
)

SELECT *
FROM date_cte