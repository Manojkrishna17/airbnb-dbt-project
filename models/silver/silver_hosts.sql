{{ config(unique_key='host_id') }}

SELECT
    host_id,
    TRIM(host_name) AS host_name,
    host_since,
    is_superhost,
    response_rate,
    CASE
        WHEN response_rate >= 90 THEN 'Very Good'
        WHEN response_rate >= 75 THEN 'Good'
        WHEN response_rate >= 50 THEN 'Fair'
        WHEN response_rate IS NOT NULL THEN 'Poor'
        ELSE 'Unknown'
    END AS response_rate_category,
    created_at
FROM {{ ref('bronze_hosts') }}
WHERE host_id IS NOT NULL

{% if is_incremental() %}
  AND created_at > (SELECT MAX(created_at) FROM {{ this }})
{% endif %}