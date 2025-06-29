-- Create necessary ENUM types
-- User Roles
CREATE TYPE user_role_enum AS ENUM ('guest', 'host', 'admin');
-- Booking Status
CREATE TYPE booking_status_enum AS ENUM ('pending', 'confirmed', 'canceled');
-- Payment Method
CREATE TYPE payment_method_enum AS ENUM ('credit_card', 'paypal', 'stripe');

-- Table: Users
CREATE TABLE Users (
    user_id UUID PRIMARY KEY DEFAULT gen_random_uuid(), -- gen_random_uuid() for PostgreSQL, use UUID() for MySQL
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    role user_role_enum NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Table: Property
CREATE TABLE Property (
    property_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    host_id UUID NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    pricepernight DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- ON UPDATE CURRENT_TIMESTAMP is MySQL specific. For PostgreSQL, use a trigger.

    CONSTRAINT fk_host
        FOREIGN KEY (host_id)
        REFERENCES Users(user_id)
        ON DELETE CASCADE -- If a user (host) is deleted, their properties are also deleted
);


-- Table: Booking
CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status booking_status_enum NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_booking_property
        FOREIGN KEY (property_id)
        REFERENCES Property(property_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_booking_user
        FOREIGN KEY (user_id)
        REFERENCES Users(user_id)
        ON DELETE CASCADE,
    -- Add a constraint toensure end_date is not before start_date
    CONSTRAINT chk_end_date_after_start_date
        CHECK (end_date >= start_date)
);

-- Table: Payment
CREATE TABLE Payment (
    payment_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    booking_id UUID NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    payment_method payment_method_enum NOT NULL,

    CONSTRAINT fk_payment_booking
        FOREIGN KEY (booking_id)
        REFERENCES Booking(booking_id)
        ON DELETE CASCADE -- If a booking is deleted, its payments are also deleted
);


-- Table: Review
CREATE TABLE Review (
    review_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    rating INTEGER NOT NULL,
    comment TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT chk_rating_range
        CHECK (rating >= 1 AND rating <= 5),
    CONSTRAINT fk_review_property
        FOREIGN KEY (property_id)
        REFERENCES Property(property_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_review_user
        FOREIGN KEY (user_id)
        REFERENCES Users(user_id)
        ON DELETE CASCADE
);


-- Table: Message
CREATE TABLE Message (
    message_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    sender_id UUID NOT NULL,
    recipient_id UUID NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_message_sender
        FOREIGN KEY (sender_id)
        REFERENCES Users(user_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_message_recipient
        FOREIGN KEY (recipient_id)
        REFERENCES Users(user_id)
        ON DELETE CASCADE,
    -- A user cannot send a message to themselves (optional, depending on business logic)
    CONSTRAINT chk_different_sender_recipient
        CHECK (sender_id <> recipient_id)
);


-- Indexes on Foreign Keys (often beneficial for JOINs)
CREATE INDEX idx_property_host_id ON Property (host_id);
CREATE INDEX idx_booking_property_id ON Booking (property_id);
CREATE INDEX idx_booking_user_id ON Booking (user_id);
CREATE INDEX idx_payment_booking_id ON Payment (booking_id);
CREATE INDEX idx_review_property_id ON Review (property_id);
CREATE INDEX idx_review_user_id ON Review (user_id);
CREATE INDEX idx_message_sender_id ON Message (sender_id);
CREATE INDEX idx_message_recipient_id ON Message (recipient_id);

