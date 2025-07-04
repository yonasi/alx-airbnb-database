-- TASK0: INNER JOIN
-- To make it easy to see the status of the booking on first column.

SELECT
    B.booking_id,
    B.status,
    B.start_date,
    B.end_date,
    U.first_name,
    U.last_name,
    U.email,
    U.phone_number
FROM
    Booking B
INNER JOIN 
    USERS U ON B.user_id = U.user_id
ORDER BY
    B.start_date DESC,
    B.status ASC;


--TASK0: LEFT JOIN
-- Show reviews with high rating first
SELECT
    p.property_id,
    P.name,
    P.location,
    P.pricepernight,
    --R.rating,
    R.comment,
    R.created_at
FROM
    Property P
LEFT JOIN
    Review R ON P.property_id = R.property_id
--ORDER BY 
    --R.rating DESC;


--TASK0: FULL OUTER JOIN
--For MYSQL
SELECT
    B.booking_id,
    B.status,
    B.start_date,
    B.end_date,
    U.user_id,
    U.first_name,
    U.last_name,
    U.email,
    U.phone_number
FROM
    Booking B 
LEFT JOIN
    USERS U ON B.user_id = U.user_id

UNION

SELECT
    B.status,
    B.start_date,
    B.end_date,
    U.first_name,
    U.last_name,
    U.email,
    U.phone_number
FROM
    Booking B 
RIGHT JOIN
    USERS U ON B.user_id = U.user_id;

