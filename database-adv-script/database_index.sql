-- Index on user_id in bookings (frequently used in joins and filtering)
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Index on property_id in bookings (used in joins)
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Index on users.email (if used for login or lookup)
CREATE INDEX idx_users_email ON users(email);

-- Index on properties.name (useful for search and ordering)
CREATE INDEX idx_properties_name ON properties(name);