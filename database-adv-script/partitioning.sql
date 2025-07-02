--- Alter the booking table and rename it
ALTER TABLE bookings RENAME TO bookings_backup;

--- Create new table for partitioning
CREATE TABLE bookings(
    booking_id SERIAL PRIMARY KEY NOT NULL,
    user_id INTEGER NOT NULL REFERENCES,
    property_id INTEGER NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(50) NOT NULL,
    total_price DECIMAL(10,2)
    created_at TIMESTAMP
) PARTITION BY RANGE(start_date);

--- Create partition for each year
CREATE TABLE bookings_2021 PARTITION OF bookings 
    FOR VALUES FROM ("2021-01-01") TO ("2022-01-01");

CREATE TABLE bookings_2022 PARTITION OF bookings
    FOR VALUES FROM ('2022-01-01') TO ('2023-01-01');

CREATE TABLE bookings_2023 PARTITION OF bookings
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');


--- Create indexes to stick the year to the partitioned table 
CREATE INDEX idx_bookings_2021_user_id ON bookings_2021(user_id);
CREATE INDEX idx_bookings_2022_user_id ON bookings_2022(user_id);
CREATE INDEX idx_bookings_2023_user_id ON bookings_2023(user_id);

--- Testing the performance
EXPLAIN ANALYZE
SELECT *
FROM
    bookings b
WHERE start_date BETWEEN '2022-04-05' AND '2022-09-22'
