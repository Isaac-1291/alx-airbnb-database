# Performance Monitoring Report

## Objective
Continuously monitor and refine database performance by analyzing query execution plans and implementing schema adjustments.

---

## Step 1: Monitor Queries

We used the following SQL commands to monitor frequently used queries:

### Example Query 1
```sql
EXPLAIN SELECT * FROM bookings WHERE user_id = 1;

### Example Query 2
EXPLAIN SELECT * FROM properties WHERE name LIKE '%apartment%';

Findings:
Query 1 on bookings.user_id was slow due to no index on user_id.
Query 2 was slower because %LIKE% queries do not use indexes effectively.

CREATE INDEX idx_user_id ON bookings(user_id);

ALTER TABLE properties ADD FULLTEXT(name);

EXPLAIN SELECT * FROM bookings WHERE user_id = 1;
-- Full table scan

EXPLAIN SELECT * FROM bookings WHERE user_id = 1;
-- Index lookup used

Execution time improved by over 60% on targeted queries.

Full table scans reduced due to proper indexing.



