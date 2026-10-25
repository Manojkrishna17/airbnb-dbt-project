-- silver_bookings.sql
{{ config(unique_key='booking_id') }}

SELECT
    booking_id,
    listing_id,
    booking_date,
    nights_booked,
    booking_amount,
    cleaning_fee,
    service_fee,
    COALESCE(booking_amount, 0) + COALESCE(cleaning_fee, 0) + COALESCE(service_fee, 0) AS total_booking_amount,
    UPPER(TRIM(booking_status)) AS booking_status,
    created_at
FROM {{ ref('bronze_bookings') }}
WHERE booking_id IS NOT NULL

{% if is_incremental() %}
  AND created_at > (SELECT MAX(created_at) FROM {{ this }})
{% endif %}