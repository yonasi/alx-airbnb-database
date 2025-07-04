-- find all properties where the average rating is greater than 4.0
-- also displays average ratins
SELECT
    P.property_id,
    p.name,
    P.location,
    P.pricepernight,
    AR.average_rating
FROM 
    Property p
LEFT JOIN (
            SELECT
                R.property_id,
                AVG(R.rating) AS average_rating
            FROM
                Review R
            GROUP BY
                R.property_id
            HAVING
                AVG(R.rating) > 4) AS AR ON P.property_id = AR.property_id;


--display users with morethan 3 bookings.
SELECT
    U.user_id,
    U.first_name,
    U.last_name,
    U.email,
    U.phone_number
FROM 
    USERS U
WHERE
    (SELECT
        COUNT(B.booking_id)
    FROM
        Booking B
    WHERE
        B.user_id = U.user_id 
    ) > 3;
