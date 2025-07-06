 1. INNER JOIN: Bookings and their users
SELECT 
    bookings.id AS booking_id, 
    bookings.property_id, 
    bookings.start_date, 
    bookings.end_date,
    users.id AS user_id, 
    users.name AS user_name
FROM bookings
INNER JOIN users ON bookings.user_id = users.id;

-- 2. LEFT JOIN: Properties and their reviews (including those without reviews)
SELECT 
    properties.id AS property_id, 
    properties.name AS property_name,
    reviews.id AS review_id, 
    reviews.comment
FROM properties
LEFT JOIN reviews ON properties.id = reviews.property_id;

-- 3. FULL OUTER JOIN simulation: All users and bookings, even if not linked
SELECT 
    users.id AS user_id, 
    users.name AS user_name,
    bookings.id AS booking_id, 
    bookings.property_id, 
    bookings.start_date, 
    bookings.end_date
FROM users
LEFT JOIN bookings ON users.id = bookings.user_id

UNION

SELECT 
    users.id AS user_id, 
    users.name AS user_name,
    bookings.id AS booking_id, 
    bookings.property_id, 
    bookings.start_date, 
    bookings.end_date
FROM users
RIGHT JOIN bookings ON users.id = bookings.user_id;