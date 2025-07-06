-- Create partitioned Booking table based on start_date

CREATE TABLE bookings_partitioned (
    id INT PRIMARY KEY,
    user_id INT,
    property_id INT,
    start_date DATE,
    end_date DATE
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2019 VALUES LESS THAN (2020),
    PARTITION p2020 VALUES LESS THAN (2021),
    PARTITION p2021 VALUES LESS THAN (2022),
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION pmax VALUES LESS THAN MAXVALUE
);

-- Sample query to test performance
EXPLAIN
SELECT * FROM bookings_partitioned
WHERE start_date BETWEEN '2021-01-01' AND '2021-12-31';