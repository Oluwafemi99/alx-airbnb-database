-- SQL query using an INNER JOIN to retrieve all bookings 
-- along with the users who made those bookings
SELECT 
    bookings.booking_id,
    bookings.start_date,
    bookings.end_date,
    bookings.status,
    bookings.total_price,
    users.user_id,
    users.name AS user_name,
    users.email
FROM 
    bookings
INNER JOIN 
    users ON bookings.user_id = users.user_id;



--SQL query using aLEFT JOIN to retrieve all properties and their reviews, 
-- including properties that have no reviews

SELECT 
    properties.property_id,
    properties.title,
    properties.price_per_night,
    reviews.review_id,
    reviews.rating,
    reviews.comment
FROM 
    properties
LEFT JOIN 
    reviews ON properties.property_id = reviews.property_id
ORDER BY 
    properties.property_id, reviews.review_id;



-- SQL query using a FULL OUTER JOIN to retrieve all users and all bookings,
-- even if the user has no booking or a booking is not linked to a user

SELECT 
    users.user_id,
    users.name AS user_name,
    bookings.booking_id,
    bookings.start_date,
    bookings.end_date
FROM 
    users
FULL OUTER JOIN bookings ON users.user_id = bookings.user_id;
