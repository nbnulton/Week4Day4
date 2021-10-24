----1. List all customers who live in Texas (use JOINs)
--SELECT address.address_id, address.postal_code
--FROM address
--INNER JOIN customer
--ON address.address_id = address.address_id
--WHERE postal_code = '75%'

----2. Get all payments above $6.99 with the Customer's Full Name
--SELECT payment.amount, payment.customer_id
--FROM payment
--INNER JOIN customer
--ON payment.customer_id = customer.customer_id
--WHERE amount > 6.99

----3. Show all customers names who have made payments over $175(use subqueries)
--SELECT *
--FROM customer
--WHERE customer_id IN (
--    SELECT customer_id
--    FROM payment
--    GROUP BY customer_id
--    HAVING SUM(amount) >= 175
--    ORDER BY SUM(amount)
--);

----4. List all customers that live in Nepal (use the city table)
--SELECT customer.first_name,customer.last_name
--FROM customer
--JOIN address
--ON customer.address_id = address.address_id
--JOIN city
--ON address.city_id = city.city_id
--WHERE city = 'Nepal'


----5. Which staff member had the most transactions?
--SELECT staff.staff_id
--FROM staff
--JOIN rental
--ON staff.staff_id = rental.staff_id
--WHERE rental_date IN (
--    SELECT rental_id
--    FROM rental
--    GROUP BY staff_id
--    WHERE COUNT(rental_id)
--    ORDER BY SUM(rental_id)
--);

----6. How many movies of each rating are there?
--SELECT rating
--FROM film
--GROUP BY rating
--WHERE COUNT(rating)

----7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
--SELECT payment.amount, payment.customer_id
--FROM payment
--INNER JOIN customer
--ON payment.customer_id = customer.customer_id
--WHERE amount > 6.99

----8. How many free rentals did our stores give away?
--SELECT amount
--FROM payment
--WHERE amount <= 0.00