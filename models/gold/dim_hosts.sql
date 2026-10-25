SELECT
    host_id,
    host_name,
    host_since,
    is_superhost,
    response_rate,
    response_rate_category
FROM {{ ref('silver_hosts') }}