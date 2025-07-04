# Step 1: Enable Profiling
First, you need to tell MySQL to start collecting profiling information for subsequent queries in your current session.
```sql
    SET profiling = 1;
 ```
# Step 2: Run Your Query (or Queries)
Execute the SQL query (or queries) that you want to analyze.
```sql
    SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    b.created_at AS booking_created_at,
    u.first_name,
    u.last_name,
    p.name AS property_name,
    py.amount AS payment_amount
FROM
    Booking b
JOIN Users u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment py ON b.booking_id = py.booking_id;
```
# Step 3: View the Profile Data
After running your query, you can inspect the collected profile data.

- To see a summary of all profiled queries in the current session:

```sql
SHOW PROFILES;
 ```
This will give you a list of queries with their Query_ID and Duration. Note the Query_ID of the query you're interested in.

- To see the detailed breakdown for a specific query:
 ```sql
SHOW PROFILE FOR QUERY [Query_ID];
```