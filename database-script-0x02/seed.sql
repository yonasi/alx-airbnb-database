-- Users
INSERT INTO Users (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Alice', 'Smith', 'alice.smith@example.com', 'hashed_password_alice_123', '111-222-3333', 'host', '2024-01-15 10:00:00'),
('b1c7f0a1-7d1c-4f8e-a2b1-1c0c2e3f4a5b', 'Bob', 'Johnson', 'bob.johnson@example.com', 'hashed_password_bob_456', NULL, 'guest', '2024-01-20 11:30:00'),
('c2d8e1b2-8e2b-4e9f-b3c2-2d1d3f4a5b6c', 'Charlie', 'Brown', 'charlie.brown@example.com', 'hashed_password_charlie_789', '555-666-7777', 'admin', '2024-02-01 09:00:00'),
('d3e9f2c3-9f3c-4faa-b4d3-3e2e4f5b6c7d', 'Diana', 'Prince', 'diana.prince@example.com', 'hashed_password_diana_012', '999-888-7777', 'host', '2024-03-10 14:00:00');

-- Properties
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at) VALUES
('1a2b3c4d-5e6f-7a8b-9c0d-1e2f3a4b5c6d', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Cozy Mountain Cabin', 'A charming cabin nestled in the Rockies, perfect for a peaceful getaway.', 'Aspen, Colorado', 250.00, '2024-03-01 10:00:00', '2024-05-20 15:30:00'),
('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', 'd3e9f2c3-9f3c-4faa-b4d3-3e2e4f5b6c7d', 'Luxurious Beachfront Villa', 'Stunning villa with direct beach access and panoramic ocean views.', 'Malibu, California', 800.00, '2024-03-15 11:00:00', '2024-06-10 10:00:00'),
('3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Downtown City Apartment', 'Modern apartment in the heart of the city, close to all attractions.', 'New York, New York', 180.00, '2024-04-01 14:00:00', '2024-04-01 14:00:00');

-- Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
('4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f90', '1a2b3c4d-5e6f-7a8b-9c0d-1e2f3a4b5c6d', 'b1c7f0a1-7d1c-4f8e-a2b1-1c0c2e3f4a5b', '2024-07-10', '2024-07-15', 1250.00, 'confirmed', '2024-06-01 10:00:00'),
('5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9012', '2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', 'b1c7f0a1-7d1c-4f8e-a2b1-1c0c2e3f4a5b', '2024-08-01', '2024-08-05', 3200.00, 'pending', '2024-06-05 14:30:00'),
('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f901234', '3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', '2024-09-01', '2024-09-03', 360.00, 'canceled', '2024-06-10 09:00:00');

-- Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method) VALUES
('7a8b9c0d-1e2f-3a4b-5c6d-7e8f90123456', '4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f90', 1250.00, '2024-06-02 10:15:00', 'credit_card'),
('8b9c0d1e-2f3a-4b5c-6d7e-8f9012345678', '5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9012', 3200.00, '2024-06-06 15:00:00');

-- Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at) VALUES
('9c0d1e2f-3a4b-5c6d-7e8f-901234567890', '1a2b3c4d-5e6f-7a8b-9c0d-1e2f3a4b5c6d', 'b1c7f0a1-7d1c-4f8e-a2b1-1c0c2e3f4a5b', 5, 'Absolutely loved the cabin! Perfect views and very cozy.', '2024-07-16 12:00:00'),
('0d1e2f3a-4b5c-6d7e-8f90-123456789012', '2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', 'b1c7f0a1-7d1c-4f8e-a2b1-1c0c2e3f4a5b', 4, 'Beautiful villa, but the Wi-Fi was a bit spotty.', '2024-08-06 10:00:00');

-- Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
('1e2f3a4b-5c6d-7e8f-9012-345678901234', 'b1c7f0a1-7d1c-4f8e-a2b1-1c0c2e3f4a5b', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Hi Alice, is the cabin available for July 10-15?', '2024-05-28 09:00:00'),
('2f3a4b5c-6d7e-8f90-1234-567890123456', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'b1c7f0a1-7d1c-4f8e-a2b1-1c0c2e3f4a5b', 'Yes, Bob! It is. Looking forward to hosting you.', '2024-05-28 09:30:00'),
('3a4b5c6d-7e8f-9012-3456-789012345678', 'b1c7f0a1-7d1c-4f8e-a2b1-1c0c2e3f4a5b', 'd3e9f2c3-9f3c-4faa-b4d3-3e2e4f5b6c7d', 'Hello Diana, I am interested in your Malibu villa for August. Any flexibility on dates?', '2024-06-03 16:00:00');
