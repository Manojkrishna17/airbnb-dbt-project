SELECT 1
FROM (
    SELECT
        (SELECT SUM(total_booking_amount) FROM {{ ref('fact_bookings') }}
         WHERE booking_status <> 'CANCELLED') AS fact_total,
        (SELECT SUM(total_revenue) FROM {{ ref('revenue_by_city') }}) AS report_total
)
WHERE fact_total <> report_total