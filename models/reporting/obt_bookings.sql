SELECT
    f.booking_id,
    f.booking_date,
    f.booking_status,
    f.nights_booked,
    f.booking_amount,
    f.cleaning_fee,
    f.service_fee,
    f.total_booking_amount,
    f.expected_room_revenue,
    f.booking_value_tag,
    l.listing_id,
    l.property_type,
    l.room_type,
    l.city,
    l.country,
    l.accommodates,
    l.bedrooms,
    l.bathrooms,
    l.price_per_night,
    h.host_id,
    h.host_name,
    h.host_since,
    h.is_superhost,
    h.response_rate,
    h.response_rate_category
FROM {{ ref('fact_bookings') }} f
LEFT JOIN {{ ref('dim_listings') }} l ON f.listing_id = l.listing_id
LEFT JOIN {{ ref('dim_hosts') }} h ON f.host_id = h.host_id