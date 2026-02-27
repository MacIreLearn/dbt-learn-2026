{{ config(
    materialized = 'view'
) }}

WITH src_hosts AS (
    SELECT * FROM {{ ref('src_hosts') }}
)
SELECT
    HOST_ID,
    NVL(host_name, 'Anonymous') AS host_name,
    IFF(is_superhost = 't', TRUE, FALSE) AS is_superhost,
    host_created_at,
    host_updated_at
FROM src_hosts