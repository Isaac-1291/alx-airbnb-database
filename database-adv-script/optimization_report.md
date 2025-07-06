# Optimization Report

## Original Query
The query joins four tables: `bookings`, `users`, `properties`, and `payments`. This retrieves booking details with corresponding user, property, and payment data.

## Performance Analysis
Using `EXPLAIN`, we observed the query scanned all rows due to lack of indexes on join keys.

## Optimization
To improve performance:
- Added indexes to `user_id`, `property_id`, and `booking_id` columns.
- Ensured joins were necessary and minimal.

## Outcome
Query execution time improved significantly after indexing.

## Final Query (after optimization)
(See updated query in `perfomance.sql`)