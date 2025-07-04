-- Initial query to retrieve all bookings with user, property, and payment details
SELECT
    B.booking_id,
    B.start_date,
    B.end_date,
    B.total_price,
    B.status,
    B.created_at AS booking_created_at,
    U.user_id,
    U.first_name,
    U.last_name,
    U.email,
    U.phone_number,
    U.role AS user_role,
    P.property_id,
    P.name AS property_name,
    P.description AS property_description,
    P.location AS property_location,
    P.pricepernight,
    py.payment_id,
    py.amount AS payment_amount,
    py.payment_date,
    py.payment_method
FROM
    Booking B
JOIN
    Users U ON B.user_id = U.user_id
JOIN
    Property P ON B.property_id = P.property_id
LEFT JOIN -- Use LEFT JOIN for payments as a booking might not have a payment yet
    Payment py ON B.booking_id = py.booking_id;