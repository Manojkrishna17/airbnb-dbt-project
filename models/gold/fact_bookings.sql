SELECT
    b.booking_id,
    b.listing_id,
    l.host_id,
    b.booking_date,
    b.booking_status,
    b.nights_booked,
    b.booking_amount,
    b.cleaning_fee,
    b.service_fee,
    b.total_booking_amount,
    {{ multiply('b.nights_booked', 'l.price_per_night', 2) }} AS expected_room_revenue,
    {{ tag('b.total_booking_amount') }} AS booking_value_tag
FROM {{ ref('silver_bookings') }} b
LEFT JOIN {{ ref('silver_listings') }} l
    ON b.listing_id = l.listing_id