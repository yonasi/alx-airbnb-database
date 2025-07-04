# Add indexes if they don't already exist (foreign keys should create them)
``` sql
CREATE INDEX idx_booking_user_id ON Booking (user_id);
CREATE INDEX idx_booking_property_id ON Booking (property_id);
CREATE INDEX idx_payment_booking_id ON Payment (booking_id);
```