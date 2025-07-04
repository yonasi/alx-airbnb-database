-- We'll create partitions for 2024, 2025, and a MAXVALUE partition for all future dates.

ALTER TABLE Booking
PARTITION BY RANGE (TO_DAYS(start_date)) (
    PARTITION p2023 VALUES LESS THAN (TO_DAYS('2024-01-01')), -- For any bookings in 2023 or earlier
    PARTITION p2024 VALUES LESS THAN (TO_DAYS('2025-01-01')), -- For bookings in 2024
    PARTITION p2025 VALUES LESS THAN (TO_DAYS('2026-01-01')), -- For bookings in 2025
    PARTITION pmax VALUES LESS THAN MAXVALUE                 -- For all bookings from 2026 onwards
);