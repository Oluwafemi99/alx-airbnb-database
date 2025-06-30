--Indexes for Users Table
CREATE INDEX idx_users_user_id ON users(user_id);
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_created_at ON users(created_at);


--- Indexes for properties Table
CREATE INDEX idx_properties_property_id ON properties(property_id);
CREATE INDEX idx_properties_host_id ON properties(host_id);
CREATE INDEX idx_properties_location_id ON properties(location_id);
CREATE INDEX idx_properties_created_at ON properties(created_at);
CREATE INDEX idx_properties_price_per_night ON properties(price_per_night);


--- Indexes for Bookings Table
CREATE INDEX idx_bookings_booking_id ON bookings(booking_id);
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_start_end_date ON bookings(start_date, end_date);
CREATE INDEX idx_bookings_status ON bookings(status);
CREATE INDEX idx_bookings_created_at ON bookings(created_at);


EXPLAIN ANALYZE 
SELECT * FROM bookings WHERE user_id = 2;
