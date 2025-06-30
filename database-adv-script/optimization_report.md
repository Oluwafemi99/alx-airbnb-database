 Inefficiencies Detected:
b is using ALL (full table scan):
This means the bookings table has no useful index for filtering or joining.
Solution: Add index on user_id, property_id, booking_id.
payments is using ref:
That's okay-ish, but if not indexed, this can slow down as rows grow.
Make sure booking_id is indexed in payments.