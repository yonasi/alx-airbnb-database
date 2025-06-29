# Database Design Normalization

## Overview of the Schema

The schema consists of the following entities and their attributes:

* **User:** Stores information about users of the system.
    * `user_id` (Primary Key)
    * `first_name`, `last_name`, `email`, `password_hash`, `phone_number`, `role`, `created_at`
* **Property:** Stores details about properties available for booking.
    * `property_id` (Primary Key)
    * `host_id` (Foreign Key to User), `name`, `description`, `location`, `pricepernight`, `created_at`, `updated_at`
* **Booking:** Records booking transactions.
    * `booking_id` (Primary Key)
    * `property_id` (Foreign Key to Property), `user_id` (Foreign Key to User), `start_date`, `end_date`, `total_price`, `status`, `created_at`
* **Payment:** Stores payment details for bookings.
    * `payment_id` (Primary Key)
    * `booking_id` (Foreign Key to Booking), `amount`, `payment_date`, `payment_method`
* **Review:** Contains user reviews for properties.
    * `review_id` (Primary Key)
    * `property_id` (Foreign Key to Property), `user_id` (Foreign Key to User), `rating`, `comment`, `created_at`
* **Message:** Handles communication between users.
    * `message_id` (Primary Key)
    * `sender_id` (Foreign Key to User), `recipient_id` (Foreign Key to User), `message_body`, `sent_at`

## Normalization Analysis

We will evaluate each table against the rules of 1NF, 2NF, and 3NF.

### 1st Normal Form (1NF)

* **Analysis:** Each table in the provided schema has distinct columns, and there are no multi-valued attributes (e.g., a single column storing multiple phone numbers or a list of items). Each attribute holds a single, atomic value.
* **Conclusion:** All tables in the schema are already in **1NF**.

### 2nd Normal Form (2NF)

* **Analysis:**
    * **User, Property, Booking, Payment, Review, Message Tables:** All primary keys (`user_id`, `property_id`, `booking_id`, `payment_id`, `review_id`, `message_id`) are simple (single-column) primary keys. When a table has a simple primary key, there cannot be any partial dependencies because a non-key attribute is either fully dependent on the entire (simple) primary key or not dependent at all.
* **Conclusion:** All tables in the schema are already in **2NF**.

### 3rd Normal Form (3NF)

* **Analysis:** We examine each table for transitive dependencies:
    * **User Table:** `user_id` is the primary key. All other attributes (`first_name`, `last_name`, `email`, `password_hash`, `phone_number`, `role`, `created_at`) are directly dependent on `user_id`. There are no non-key attributes that determine other non-key attributes.
    * **Property Table:** `property_id` is the primary key. `host_id` is a foreign key, correctly referencing the `User` table. All other attributes (`name`, `description`, `location`, `pricepernight`, `created_at`, `updated_at`) are directly dependent on `property_id`. No transitive dependencies exist.
    * **Booking Table:** `booking_id` is the primary key. `property_id` and `user_id` are foreign keys. `start_date`, `end_date`, `total_price`, `status`, `created_at` are directly dependent on `booking_id`. No transitive dependencies exist.
    * **Payment Table:** `payment_id` is the primary key. `booking_id` is a foreign key. `amount`, `payment_date`, `payment_method` are directly dependent on `payment_id`. No transitive dependencies exist.
    * **Review Table:** `review_id` is the primary key. `property_id` and `user_id` are foreign keys. `rating`, `comment`, `created_at` are directly dependent on `review_id`. No transitive dependencies exist.
    * **Message Table:** `message_id` is the primary key. `sender_id` and `recipient_id` are foreign keys. `message_body`, `sent_at` are directly dependent on `message_id`. No transitive dependencies exist.
* **Conclusion:** All tables in the schema are already in **3NF**.

## Summary of Normalization and Redundancy

The provided database schema is well-designed and already conforms to the principles of 3NF.

* **No apparent redundancies:** Each piece of information (e.g., a user's name, a property's description) is stored in only one logical place. Foreign keys are used effectively to link related data across tables instead of duplicating it.
* **No identified normalization violations:** All tables satisfy 1NF, 2NF, and 3NF rules. This minimizes data anomalies (insertion, update, deletion anomalies) and ensures data integrity.

Therefore, no adjustments are required to achieve 3NF; the current design is already optimized for this level of normalization.