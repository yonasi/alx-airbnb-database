-- To find the total number of bookings made by each user
SELECT
    U.user_id,
    U.first_name,
    U.last_name,
    U.email,
    COUNT(B.booking_id) AS total_bookings_made
FROM
    Users U
LEFT JOIN 
    Booking B ON U.user_id = B.user_id
GROUP BY
    U.user_id,
    U.first_name,
    U.last_name,
    U.email 
ORDER BY
    total_bookings_made DESC, 
    U.last_name ASC,
    U.first_name ASC;


-- Use a window function (ROW_NUMBER, RANK) to rank properties based on the 
 --total number of bookings they have received
WITH PropertyBookingCounts AS (
    SELECT
        P.property_id,
        P.name AS property_name,
        COUNT(B.booking_id) AS total_bookings_received
    FROM
        Property P
    LEFT JOIN 
        Booking B ON P.property_id = B.property_id
    GROUP BY
        P.property_id,
        P.name
)
SELECT
    property_id,
    property_name,
    total_bookings_received,
    ROW_NUMBER() OVER (ORDER BY total_bookings_received DESC, property_name ASC) AS row_num_rank,
    RANK() OVER (ORDER BY total_bookings_received DESC, property_name ASC) AS rank_rank,
    DENSE_RANK() OVER (ORDER BY total_bookings_received DESC, property_name ASC) AS dense_rank_rank
FROM
    PropertyBookingCounts
ORDER BY
    total_bookings_received DESC,
    property_name ASC;