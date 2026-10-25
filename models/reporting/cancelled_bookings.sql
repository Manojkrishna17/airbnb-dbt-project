WITH history AS (
    SELECT
        booking_id,
        listing_id,
        booking_status,
        booking_amount,
        valid_from,
        LAG(booking_status) OVER (PARTITION BY booking_id ORDER BY valid_from) AS previous_status
    FROM {{ ref('fact_booking_status_history') }}
)

SELECT
    booking_id,
    listing_id,
    booking_amount AS lost_amount,
    valid_from AS cancelled_at
FROM history
WHERE booking_status = 'CANCELLED'
  AND previous_status = 'CONFIRMED'