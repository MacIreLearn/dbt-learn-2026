WITH l AS (
    SELECT *
    FROM {{ ref('dim_listing_cleansed') }}
),
h AS (
    SELECT *
    FROM {{ ref('dim_hosts_cleansed') }}
)
SELECT
    l.listing_id,
    l.listing_name,
    l.room_type,
    l.minimum_nights,
    l.price,
    l.host_id,
    h.is_superhost as host_is_superhost,
    l.created_at,
    greatest(l.updated_at, h.host_updated_at) as updated_at
FROM l
left join h on l.host_id = h.host_id
    