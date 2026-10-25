SELECT
    dbt_scd_id AS booking_version_id,
    booking_id,
    listing_id,
    UPPER(TRIM(booking_status)) AS booking_status,
    nights_booked,
    booking_amount,
    dbt_valid_from AS valid_from,
    dbt_valid_to AS valid_to,
    CASE WHEN dbt_valid_to IS NULL THEN TRUE ELSE FALSE END AS is_current,
    ROW_NUMBER() OVER (PARTITION BY booking_id ORDER BY dbt_valid_from) AS version_number
FROM {{ ref('snap_bookings') }}