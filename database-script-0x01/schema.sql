 USER TABLE
CREATE TABLE User (
    user_id UUID PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    role VARCHAR(10) CHECK (role IN ('guest', 'host', 'admin')) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- PROPERTY TABLE
CREATE TABLE Property (
    property_id UUID PRIMARY KEY,
    host_id UUID REFERENCES User(user_id),
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(200) NOT NULL,
    pricepernight DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- BOOKING TABLE
CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID REFERENCES Property(property_id),
    user_id UUID REFERENCES User(user_id),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status VARCHAR(10) CHECK (status IN ('pending', 'confirmed', 'canceled')) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- PAYMENT TABLE
CREATE TABLE Payment (
    payment_id UUID PRIMARY KEY,
    booking_id UUID REFERENCES Booking(booking_id),
    amount DECIMAL(10,2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(20) CHECK (payment_method IN ('credit_card', 'paypal', 'stripe')) NOT NULL
);

-- REVIEW TABLE
CREATE TABLE Review (
    review_id UUID PRIMARY KEY,
    property_id UUID REFERENCES Property(property_id),
    user_id UUID REFERENCES User(user_id),
    rating INTEGER CHECK (rating >= 1 AND rating <= 5) NOT NULL,
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- MESSAGE TABLE
CREATE TABLE Message (
    message_id UUID PRIMARY KEY,
    sender_id UUID REFERENCES User(user_id),
    recipient_id UUID REFERENCES User(user_id),
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- INDEXES FOR PERFORMANCE
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_booking_user ON Booking(user_id);
CREATE INDEX idx_payment_booking ON Payment(booking_id);