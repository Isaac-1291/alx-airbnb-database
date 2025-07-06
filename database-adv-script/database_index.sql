-- Create index on users.name for faster searches
CREATE INDEX idx_users_name ON users(name);

-- Create index on bookings.user_id to optimize user-booking relationships
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Create index on bookings.start_date to speed up date-based queries
CREATE INDEX idx_bookings_start_date ON bookings(start_date);

-- Create index on properties.name to speed up property name lookups
CREATE INDEX idx_properties_name ON properties(name);

-- Analyze performance before and after indexing
EXPLAIN SELECT * FROM bookings WHERE user_id = 3;