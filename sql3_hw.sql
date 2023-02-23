-- 1: List all customers who live in Texas (use joins)
SELECT first_name, last_name
FROM customer
WHERE address_id IN (
    SELECT customer.address_id
    FROM customer
    INNER JOIN address
    ON customer.address_id=address.address_id
    WHERE district = 'Texas'
);

-- Answer: 5 poeple from texas

-- 2: Get all the payments above 6.99 with the customers full name
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer.customer_id
    FROM customer
    INNER JOIN payment
    ON customer.customer_id=payment.customer_id
    WHERE amount > 6.99
);

-- Answer: 597 poeple had payments above 6.99

-- 3: Show all customers names who have made payments over $175(use subqueries)
SELECT first_name, last_name,
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175
);

-- Answer: 135 have total payments over $175

-- 4: List all customers that live in Nepal (use the city table)
SELECT first_name, last_name
FROM customer
WHERE address_id IN (
    SELECT customer.address_id
    FROM customer
    INNER JOIN address
    ON customer.address_id=address.address_id
    INNER JOIN city
    on address.city_id=city.city_id
    WHERE city = 'Nepal'
);

-- Answer: There are no customers from Nepal

-- 5: Which staff member had the most transactions?
SELECT staff_id
FROM payment
GROUP BY staff_id
ORDER BY COUNT(amount) DESC;

-- Answer: staff id 2 have the most transactions

SELECT staff_id, first_name, last_name FROM staff;

-- Answer: staff id 2 = Jon Stephens

-- 6: How many movies of each rating are there?

SELECT rating, COUNT(rating)
FROM film
GROUP BY rating

-- Answer: PG-13 has 223, NC-17 has 209, R has 196, PG has 194, and G has 178

-- 7: Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    WHERE amount > 6.99
);

-- Answer: There are 597 custmers who have made at least one payment over $6.99

-- 8: How many free rentals did our store give away?

SELECT COUNT(amount) FROM payment WHERE amount = 0.00;
SELECT MIN(amount) FROM payment;

-- Answer: The store didn't have any free rentals. Minimum cost was $2.00