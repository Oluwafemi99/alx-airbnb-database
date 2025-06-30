---query to find the total number of bookings made by each user, 
---using the COUNT function and GROUP BY clause

SELECT
    u.user_id
    u.name
    COUNT(b.booking_id) AS total_booking
FROM
    users u
LEFT JOIN
    bookings b ON u.user_id = b.user_id
GROUP BY
    u.user, u.name;


---SQL window function (ROW_NUMBER, RANK) to rank properties
---based on the total number of bookings they have received.

SELECT
    p.property_id,
    p.title
    COUNT(b.booking_id) AS total_booking,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM
    properties p
LEFT JOIN
    bookings b ON p.property_id = b.property_id
GROUP BY
    p.property_id, p.title;
