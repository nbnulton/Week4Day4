INSERT INTO "order"(amount, customer_id)
VALUES
(34.56,1),
(78.50,3),
(24.00,2),
(65.50,3),
(55.50,NULL)

----
CREATE TABLE customer(
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(200),
    address VARCHAR(150),
    city VARCHAR(150),
    customer_state VARCHAR(100),
    zip_code VARCHAR(50)
);

CREATE TABLE "order"(
    order_id SERIAL PRIMARY KEY,
    order_date date DEFAULT CURRENT_DATE,
    amount NUMERIC(4,2),
    customer_id INTEGER NOT NULL,

    FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE
);
----
-- Inner Join
SELECT customer.first_name, customer.last_name, "order".order_date, "order".amount
FROM customer
INNER JOIN "order"
ON customer.customer_id = "order".customer_id

----
-- Basic SubQuery
-- Subquery to find the 6 customers that have
-- A total amount of payments greater than 175

SELECT *
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) >= 175
    ORDER BY SUM(amount)
    
);

----
-- Join with Subquery

-- From angola and the have sum amount spent >= 175
SELECT customer.first_name,customer.last_name,customer.email,country
FROM customer
JOIN address
ON customer.address_id = address.address_id
JOIN city
ON address.city_id = city.city_id
JOIN country
ON city.country_id = country.country_id
WHERE country ='Angola' AND customer_id IN (SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) >= 175
    ORDER BY SUM(amount))

----
