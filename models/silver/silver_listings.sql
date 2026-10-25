{{ config(unique_key='listing_id') }}

SELECT
    listing_id,
    host_id,
    property_type,
    room_type,
    INITCAP(TRIM(city)) AS city,
    INITCAP(TRIM(country)) AS country,
    accommodates,
    bedrooms,
    bathrooms,
    price_per_night,
    created_at
FROM {{ ref('bronze_listings') }}
WHERE listing_id IS NOT NULL
  AND price_per_night > 0

{% if is_incremental() %}
  AND created_at > (SELECT MAX(created_at) FROM {{ this }})
{% endif %}