-- 1. Total number of bookings per user
SELECT users.id AS user_id, users.name AS user_name, COUNT(bookings.id) AS total_bookings
FROM users
JOIN bookings ON users.id = bookings.user_id
GROUP BY users.id, users.name
ORDER BY total_bookings DESC;

-- 2. Rank properties using ROW_NUMBER based on total number of bookings
SELECT property_id, COUNT(*) AS total_bookings,
       ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS rank
FROM bookings
GROUP BY property_id;