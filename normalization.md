# Database Normalization for Airbnb Booking System

## ✅ Objective

To apply normalization principles to ensure the Airbnb database schema is in **Third Normal Form (3NF)**, by eliminating redundancies and ensuring functional dependencies are properly handled.

---

## 🔹 1. First Normal Form (1NF)

**Rule:**  
- Eliminate repeating groups
- Each field must contain only **atomic values**

✅ Our schema satisfies 1NF:
- All fields contain atomic data (e.g., `first_name`, `email`, `pricepernight`)
- No lists or sets used in any field
- No repeating columns

---

## 🔹 2. Second Normal Form (2NF)

**Rule:**  
- Must be in 1NF  
- Every non-primary-key attribute must be **fully functionally dependent** on the **entire** primary key

✅ Our schema satisfies 2NF:
- All primary keys are single-column UUIDs (e.g., `user_id`, `property_id`, etc.)
- No partial dependencies exist
- All fields depend on the full primary key of their respective tables

---

## 🔹 3. Third Normal Form (3NF)

**Rule:**  
- Must be in 2NF  
- No **transitive dependencies** (i.e., non-key → non-key dependencies)

✅ We verified:
- All non-key fields depend **only** on the primary key
- No derived or redundant fields exist (e.g., total_price is derived, but acceptable since it’s calculated at booking time)
- User roles, property info, booking status, and payment method are clearly separated and not duplicated across tables

---

## ✅ Adjustments Made to Ensure 3NF

| Issue Identified                           | Action Taken                                                   |
|--------------------------------------------|----------------------------------------------------------------|
| Booking `status` and Payment `method` were repeated text fields | Converted to **ENUMs** to limit and standardize values         |
| Host info duplicated in Property           | Used `host_id` as **foreign key** to `User(user_id)`           |
| Sender/Recipient in Message                | Used **foreign keys** instead of copying user details          |
| Reviews per property with rating/comment   | Structured into its own `Review` table with FKs to `Property` and `User` |

---

## ✅ Final Result

The current Airbnb database schema is:
- In **3NF**
- Efficient and clean
- Optimized to avoid redundancy
- Built with proper relationships using **foreign keys** and ENUMs

---

## 📎 Related Tables in Scope:
- `User`
- `Property`
- `Booking`
- `Payment`
- `Review`
- `Message`