# Entity-Relationship Diagram – Airbnb Booking System

## ✅ Entities and Their Attributes

### 1. User
- user_id (PK)
- first_name
- last_name
- email (UNIQUE)
- password_hash
- phone_number
- role (guest, host, admin)
- created_at

### 2. Property
- property_id (PK)
- host_id (FK → User.user_id)
- name
- description
- location
- pricepernight
- created_at
- updated_at

### 3. Booking
- booking_id (PK)
- property_id (FK → Property.property_id)
- user_id (FK → User.user_id)
- start_date
- end_date
- total_price
- status (ENUM: pending, confirmed, canceled)
- created_at

### 4. Payment
- payment_id (PK)
- booking_id (FK → Booking.booking_id)
- amount
- payment_date
- payment_method (ENUM: credit_card, paypal, stripe)

### 5. Review
- review_id (PK)
- property_id (FK → Property.property_id)
- user_id (FK → User.user_id)
- rating (1–5)
- comment
- created_at

### 6. Message
- message_id (PK)
- sender_id (FK → User.user_id)
- recipient_id (FK → User.user_id)
- message_body
- sent_at

---

## ✅ Relationships Between Entities

| Relationship                        | Description                                                     |
|------------------------------------|-----------------------------------------------------------------|
| User ↔ Booking                     | One user can make many bookings                                 |
| User ↔ Property                    | A user (host) can own many properties                           |
| Booking ↔ Property                 | One booking is for one property                                 |
| Booking ↔ Payment                  | One booking has one payment                                     |
| User ↔ Review                      | A user can leave many reviews                                   |
| Property ↔ Review                  | A property can have many reviews                                |
| User ↔ Message (self-join)         | A user can send/receive messages to/from other users            |

---



