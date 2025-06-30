---Identify high-usage columns in your User, Booking, and Property tables (e.g., columns used in WHERE, JOIN, ORDER BY clauses).
---
USER TABLE
user_id	Used in JOINs with bookings, reviews, etc.

BOOKING TABLE
user_id	JOINs to find who made the booking
property_id	JOINs to see what was booked.

PROPERTY TABLE
property_id	Used in JOINs with bookings, reviews, etc