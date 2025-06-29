
-- ================= USERS =================
INSERT INTO users (name, email, password, phone, role)
VALUES
('Femi Host', 'femi.host@example.com', 'hashed_pw_1', '08030000001', 'host'),
('Ada Guest', 'ada.guest@example.com', 'hashed_pw_2', '08030000002', 'guest'),
('John Guest', 'john.guest@example.com', 'hashed_pw_3', '08030000003', 'guest');

-- ================= LOCATIONS =================
INSERT INTO locations (city, country)
VALUES
('Lagos', 'Nigeria'),
('Cape Town', 'South Africa');

-- ================= PROPERTIES =================
INSERT INTO properties (host_id, location_id, title, description, address, price_per_night)
VALUES
(1, 1, 'Cozy Apartment in Lagos', 'Close to the beach, WiFi included.', 'Lekki Phase 1', 25000.00),
(1, 2, 'Modern Studio in Cape Town', 'Mountain view, self-catering.', 'Kloof Street', 32000.00);

-- ================= PROPERTY IMAGES =================
INSERT INTO property_images (property_id, image_url, caption)
VALUES
(1, 'https://example.com/img1.jpg', 'Living room with ocean view'),
(1, 'https://example.com/img2.jpg', 'Bedroom with king-size bed'),
(2, 'https://example.com/img3.jpg', 'Studio interior design');

-- ================= BOOKINGS =================
INSERT INTO bookings (user_id, property_id, start_date, end_date, status, total_price)
VALUES
(2, 1, '2025-07-01', '2025-07-05', 'confirmed', 100000.00),
(3, 2, '2025-08-10', '2025-08-12', 'confirmed', 64000.00);

-- ================= PAYMENTS =================
INSERT INTO payments (booking_id, amount, method, status, paid_at)
VALUES
(1, 100000.00, 'card', 'paid', '2025-06-20 14:30:00'),
(2, 64000.00, 'transfer', 'paid', '2025-06-22 10:45:00');

-- ================= REVIEWS =================
INSERT INTO reviews (booking_id, user_id, rating, comment)
VALUES
(1, 2, 5, 'Amazing place, clean and well-located!'),
(2, 3, 4, 'Great stay, would book again.');
