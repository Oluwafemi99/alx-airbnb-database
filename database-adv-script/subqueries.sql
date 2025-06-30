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

