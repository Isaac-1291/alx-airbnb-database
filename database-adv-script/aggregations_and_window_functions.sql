-- 1. Total number of bookings per user
SELECT users.id AS user_id, users.name AS user_name, COUNT(bookings.id) AS total_bookings
FROM users
JOIN bookings ON users.id = bookings.user_id
GROUP BY users.id, users.name
ORDER BY total_bookings DESC;

-- 2. Rank properties using ROW_NUMBER
SELECT property_id, COUNT(*) AS total_bookings,
       ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS row_num_rank
FROM bookings
GROUP BY property_id;

-- 3. Rank properties using RANK
SELECT property_id, COUNT(*) AS total_bookings,
       RANK() OVER (ORDER BY COUNT(*) DESC) AS rank_position
FROM bookings
GROUP BY property_id;