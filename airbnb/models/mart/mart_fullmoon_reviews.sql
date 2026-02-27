{{ config(materialized = 'table') }}
WITH fct_reviews AS (
    SELECT *
    FROM {{ ref('fct_reviews') }}
),
ful_moon_dates AS (
    SELECT * FROM {{ ref('seeds_full_moon_dates') }}
)
SELECT r.*,
case when f.full_moon_date is not null then 'Full Moon' else 'Not Full Moon' end as is_full_moon
FROM fct_reviews r
left JOIN ful_moon_dates f ON to_date(r.review_date) = DATEADD(day,1,f.full_moon_date)
