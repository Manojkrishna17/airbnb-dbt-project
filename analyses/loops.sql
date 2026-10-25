{% set cols = ['nights_booked','booking_id','booking_amount']%}

select
{%for col in cols %}
    {{ col }}
        {%if not loop.lost %}, {% endif %}
{% endfor %}
from {{ ref ('bronze_bookings')}}