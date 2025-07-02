Performance Optimization Report
Objective

The purpose of this report is to document performance improvements applied to the Airbnb Clone database system, particularly on the `bookings` table. The focus is on improving query speed and resource efficiency using indexing, partitioning, and query analysis.

---

Query Analysis Using `EXPLAIN ANALYZE`

Example Query Tested:

```sql
EXPLAIN
SELECT *
FROM bookings
WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';
```
--- before optimization
Sequential scan across all rows in the bookings table
High execution time
All partitions scanned (or full table scan if not partitioned)

---After optimization
Partition pruning: only bookings_2023 scanned
Index scan instead of sequential scan
Execution time significantly reduced


--- Indexing 
booking start_date for Faster date filtering
bookings user_id, Speed up user-related lookups
users user_id, Optimize joins with bookings
properties property_id Optimize property joins
payments booking_id for booking-payment joins

