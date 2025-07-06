-- Initial query to retrieve bookings with user, property, and payment details
SELECT
  bookings.id AS booking_id,
  users.name AS user_name,
  properties.name AS property_name,
  payments.amount,
  payments.payment_date
FROM bookings
JOIN users ON bookings.user_id = users.id
JOIN properties ON bookings.property_id = properties.id
JOIN payments ON bookings.id = payments.booking_id;

-- Analyze performance
EXPLAIN SELECT
  bookings.id AS booking_id,
  users.name AS user_name,
  properties.name AS property_name,
  payments.amount,
  payments.payment_date
FROM bookings
JOIN users ON bookings.user_id = users.id
JOIN properties ON bookings.property_id = properties.id
JOIN payments ON bookings.id = payments.booking_id;