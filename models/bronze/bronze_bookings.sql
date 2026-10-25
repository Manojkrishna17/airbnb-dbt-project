-- bronze_bookings.sql
{{ config(unique_key='booking_id') }}

SELECT *
FROM {{ source('staging', 'bookings') }}

{% if is_incremental() %}
WHERE created_at > (SELECT MAX(created_at) FROM {{ this }})
{% endif %}

