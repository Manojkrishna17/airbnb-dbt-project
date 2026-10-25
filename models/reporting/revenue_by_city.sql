SELECT
    city,
    country,
    COUNT(booking_id) AS total_bookings,
    SUM(nights_booked) AS total_nights,
    SUM(total_booking_amount) AS total_revenue,
    ROUND(AVG(total_booking_amount), 2) AS avg_booking_value
FROM {{ ref('obt_bookings') }}
WHERE booking_status <> 'CANCELLED'
GROUP BY city, country