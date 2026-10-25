SELECT booking_id
FROM {{ ref('fact_bookings') }}
WHERE total_booking_amount < 0
   OR nights_booked <= 0