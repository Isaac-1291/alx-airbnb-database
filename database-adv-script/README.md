# Join Queries – Airbnb Clone Database

This directory contains SQL queries demonstrating various types of `JOIN` operations using a sample Airbnb clone database.

## Objectives

- Write an `INNER JOIN` query to retrieve all bookings and the users who made them.
- Use a `LEFT JOIN` to retrieve all properties and their reviews, including properties without reviews.
- Use a simulated `FULL OUTER JOIN` (with `UNION`) to retrieve all users and all bookings, even if not linked.

## Files

- `joins_queries.sql` – Contains all the SQL JOIN queries.
- `README.md` – This file.

## JOIN Types Covered

### 1. INNER JOIN
Returns records that have matching values in both tables.

### 2. LEFT JOIN
Returns all records from the left table and matched records from the right table. Unmatched right table fields will be NULL.

### 3. FULL OUTER JOIN (Simulated)
Since MySQL doesn't support `FULL OUTER JOIN`, a combination of `LEFT JOIN` and `RIGHT JOIN` via `UNION` is used to simulate it.

# Subqueries

This script contains:
- A subquery to find properties with average rating > 4.0.
- A correlated subquery to list users who have made more than 3 bookings.