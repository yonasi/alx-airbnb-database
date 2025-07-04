-- before index creation
EXPLAIN ANALYZE SELECT U.user_id, U.first_name, COUNT(B.booking_id) AS total_bookings 
FROM Users U 
LEFT JOIN Booking B ON U.user_id = B.user_id 
GROUP BY U.user_id, U.first_name 
ORDER BY U.user_id;

-- Index creation for Users first_name
CREATE INDEX idx_user_first_name ON Users(first_name);

-- index creation for Property name
CREATE INDEX idx_property_name ON Property(name);


--  prompt after index creation to see the improvment on performance
EXPLAIN ANALYZE SELECT U.user_id, U.first_name, COUNT(B.booking_id) AS total_bookings 
FROM Users U 
LEFT JOIN Booking B ON U.user_id = B.user_id 
GROUP BY U.user_id, U.first_name 
ORDER BY U.user_id;