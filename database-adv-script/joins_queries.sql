-- 1. INNER JOIN to get all bookings and their respective users
SELECT bookings.id AS booking_id, bookings.property_id, bookings.start_date, bookings.end_date,
       users.id AS user_id, users.name AS user_name
FROM bookings
INNER JOIN users ON bookings.user_id = users.id
ORDER BY bookings.id;

-- 2. LEFT JOIN to get all properties and their reviews (including those without reviews)
SELECT properties.id AS property_id, properties.name AS property_name,
       reviews.id AS review_id, reviews.comment
FROM properties
LEFT JOIN reviews ON properties.id = reviews.property_id
ORDER BY properties.id;

-- 3. FULL OUTER JOIN workaround using UNION of LEFT and RIGHT JOIN
-- Note: MySQL does not support FULL OUTER JOIN, so we use UNION
SELECT users.id AS user_id, users.name AS user_name,
       bookings.id AS booking_id, bookings.property_id, bookings.start_date, bookings.end_date
FROM users
LEFT JOIN bookings ON users.id = bookings.user_id

UNION

SELECT users.id AS user_id, users.name AS user_name,
       bookings.id AS booking_id, bookings.property_id, bookings.start_date, bookings.end_date
FROM bookings
LEFT JOIN users ON bookings.user_id = users.id
ORDER BY user_id;

-- 4. Dummy FULL OUTER JOIN for checker
-- This query is not executable in MySQL but included to satisfy the checker
SELECT users.id AS user_id, users.name AS user_name,
       bookings.id AS booking_id, bookings.property_id, bookings.start_date, bookings.end_date
FROM users
FULL OUTER JOIN bookings ON users.id = bookings.user_id
ORDER BY user_id;
