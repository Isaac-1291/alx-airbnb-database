USER
INSERT INTO User (user_id, first_name, last_name, email, password_hash, role)
VALUES
  (UUID(), 'Isaac', 'Adu', 'isaac@example.com', 'pass123', 'guest'),
  (UUID(), 'Ama', 'Mensah', 'ama@example.com', 'pass456', 'host');

-- PROPERTY
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
  (UUID(), (SELECT user_id FROM User WHERE email = 'ama@example.com'), 'Modern Loft', 'A cozy modern loft in Accra', 'Accra', 120.00);

-- BOOKING
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  (UUID(),
   (SELECT property_id FROM Property WHERE name = 'Modern Loft'),
   (SELECT user_id FROM User WHERE email = 'isaac@example.com'),
   '2025-07-10', '2025-07-12', 240.00, 'confirmed');

-- PAYMENT
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
  (UUID(),
   (SELECT booking_id FROM Booking LIMIT 1),
   240.00, 'credit_card');

-- REVIEW
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
  (UUID(),
   (SELECT property_id FROM Property LIMIT 1),
   (SELECT user_id FROM User WHERE email = 'isaac@example.com'),
   5, 'Great place and great host!');

-- MESSAGE
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
  (UUID(),
   (SELECT user_id FROM User WHERE email = 'isaac@example.com'),
   (SELECT user_id FROM User WHERE email = 'ama@example.com'),
   'Thank you for the lovely stay!');