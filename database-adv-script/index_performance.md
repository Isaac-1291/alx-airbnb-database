# Index Performance Optimization
## Created Indexes

- `idx_bookings_user_id` on `bookings(user_id)`
- `idx_bookings_property_id` on `bookings(property_id)`
- `idx_users_email` on `users(email)`
- `idx_properties_name` on `properties(name)`

## Performance Explanation

Using `EXPLAIN`, we tested queries like:

```sql
EXPLAIN SELECT * FROM bookings WHERE user_id = 1;