# Database Schema – Airbnb Booking System

## 📄 File: schema.sql

This SQL script defines the relational database schema for an Airbnb-style booking platform. It includes:

- `User`: stores platform users (guests, hosts, admins)
- `Property`: stores host listings
- `Booking`: stores reservations made by users
- `Payment`: stores payment details
- `Review`: stores user-submitted ratings and comments
- `Message`: allows users to message one another

## ✅ Key Features

- Uses `UUID` for primary keys
- Foreign keys enforce referential integrity
- ENUM-like constraints (CHECK) on roles, status, and methods
- Proper use of timestamps and indexing

## 📌 Indexes Added

- `email` for fast user lookup
- `location` for property filtering
- `user_id` and `booking_id` for performance in JOINs