# Index Performance
summary of the impact of adding indexes on qurying performance
## Indexes Added
- **Users Table**
    - Index created automaticaly: `user_id` PRIMARY KEY
    - `first_name`: Index created
        ```sql
       CREATE INDEX idx_user_first_naem ON USERS(first_name);
       ```
- **Booking Table**
    - Index created automaticaly: `booking_id` PRIMARY KEY

- **Proprty Tabel**
    - Index created automaticaly: `property_id` PRIMARY KEY
    - `name` : Index created
      ```sql
      CREATE INDEX idx_property_name ON Property(name):
    ```
# Performance Improvment 
Adding indexes to frequently queried columns improved query performance of user.first_name  
and property.name especially for searches and joins.

## Before Indexing
![Performance before indexing](/index_performanece/before_indexing.png)

## Indexing
![Indexing the database](/index_performanece/indexing.png)

## After indexing
![Performance after indexing](/index_performanece/after_indexing.png)



