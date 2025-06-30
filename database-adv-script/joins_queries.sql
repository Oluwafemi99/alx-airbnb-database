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


--- SQL query to find all properties where the average review rating is greater than 4.0.

SELECT
    p.property_id,
    p.title,
    p.price_per_night
FROM
    properties p
WHERE
    (
        SELECT AVG(r.rating)
        FROM reviews r
        WHERE r.property_id = p.property_id
    ) > 4.0;


--- SQL correlated subquery to find users who have made more than 3 bookings

SELECT
    u.user_id,
    u.name,
    u.email
FROM
    users u
WHERE
    (
        SELECT COUNT(*)
        FROM bookings b 
        WHERE b.user_id = u.user_id
    ) > 3;

