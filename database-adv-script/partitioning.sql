CREATE TABLE Booking (
    booking_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_booking_property
        FOREIGN KEY (property_id)
        REFERENCES Property(property_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_booking_user
        FOREIGN KEY (user_id)
        REFERENCES Users(user_id)
        ON DELETE CASCADE,
    CONSTRAINT chk_end_date_after_start_date
        CHECK (end_date >= start_date)
)
PARTITION BY RANGE (TO_DAYS(start_date)) (
    PARTITION p_before_2024 VALUES LESS THAN (TO_DAYS('2024-01-01')), -- Bookings before Jan 1, 2024
    PARTITION p2024 VALUES LESS THAN (TO_DAYS('2025-01-01')),         -- Bookings in 2024
    PARTITION p2025 VALUES LESS THAN (TO_DAYS('2026-01-01')),         -- Bookings in 2025
    PARTITION p_future VALUES LESS THAN MAXVALUE                     -- Bookings from 2026 onwards
);