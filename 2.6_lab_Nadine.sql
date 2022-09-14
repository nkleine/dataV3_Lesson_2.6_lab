-- LAB 2.6 Nadine

-- Task 1: In the table actor, which are the actors whose last names are not repeated? 
SELECT DISTINCT last_name FROM sakila.actor;
-- answer: 121 actors which unique last name

-- Task 2: Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once

SELECT last_name, COUNT(last_name) AS 'count' FROM sakila.actor
GROUP BY last_name
HAVING COUNT(last_name)>1
ORDER BY COUNT(last_name) ASC;

-- Task 3: Using the rental table, find out how many rentals were processed by each employee.
SELECT * FROM sakila.rental;
SELECT staff_ID, COUNT(rental_id) FROM sakila.rental
GROUP BY staff_ID;
 -- Answer: Employee 1: 8040, Employee 2: 8004

-- Task 4: Using the film table, find out how many films were released each year.
SELECT release_year, COUNT(title) FROM sakila.film
GROUP BY release_year
ORDER BY release_year ASC;
-- answer: In year 2006: 1000 Titles (that's odd)

-- Task 5: Using the film table, find out for each rating how many films were there.
SELECT rating, COUNT(title) FROM sakila.film
GROUP BY rating
ORDER BY rating ASC;

-- Task 6: What is the mean length of the film for each rating type. 
-- Round off the average lengths to two decimal places
SELECT rating, ROUND(AVG(length),2) FROM sakila.film
GROUP BY rating
ORDER BY rating ASC;

-- Task 7: Which kind of movies (rating) have a mean duration of more than two hours?
SELECT rating, AVG(length) FROM sakila.film
GROUP BY rating
HAVING AVG(length) > 120
ORDER BY rating ASC;

-- Task 8: Rank films by length (filter out the rows that have nulls or 0s in length column). 
-- In your output, only select the columns title, length, and the rank.
SELECT title, length, RANK() OVER (ORDER BY length DESC) length_rank FROM sakila.film
WHERE length <> ' ' OR length <> '0';