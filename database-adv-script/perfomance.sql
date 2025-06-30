---initial SQL query that retrieves all bookings along with the user details,
---property details, and payment details

EXPLAIN
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    --users
    u.user_id,
    u.name AS user_name,
    u.email,
    --properties
    p.property_id,
    p.title,
    p.location_id AS property_location,
    p.price_per_night,
    --payments
    p.payment_id,
    p.amount,
    p.method,
    p.paid_at

-- Join users
JOIN
    users u ON b.user_id = u.user_id
-- Join properties
JOIN
    properties p ON b.property_id = p.property_id
-- Join Payments
LEFT JOIN
    payments pay ON b.booking_id = pay.booking_id

WHERE b.status IS NOT NULL 
AND u.name IS NOT NULL;


--Refactored query for better optimization
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    --users
    u.user_id,
    u.name AS user_name,
    --properties
    p.property_id,
    p.title,
    
    --payments
    p.payment_id,
    p.amount,

JOIN
    users u ON b.user_id = u.user_id
JOIN
    properties p ON b.property_id = p.property_id

LEFT JOIN
    payments pay ON b.booking_id = pay.booking_id;


CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id)
CREATE INDEX idx_bookings_booking_id ON bookings(booking_id)
CREATE INDEX idx_payments_booking_id ON payments(booking_id)
