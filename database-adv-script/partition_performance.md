# Booking Table Partitioning Report

## Objective
To improve query performance on the large `bookings` table by partitioning it based on `start_date`.

## Method
- Partitioned the `bookings` table using `RANGE` based on the year of `start_date`.
- Tested performance using `EXPLAIN` on queries filtered by date range.

## Observation
After partitioning, the query used only the relevant partition for the date range, significantly reducing the scanned rows and improving speed.

## Conclusion
Partitioning large tables by date is effective for time-based queries.