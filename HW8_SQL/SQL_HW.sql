-- 1a. Display the first and last names of all actors from the table actor.
USE sakila;
SELECT first_name, last_name
FROM actor;
-- 1b. Display the first and last name of each actor in a single column in upper case letters. Name the column Actor Name.
SELECT concat(first_name, '', last_name) AS ' Actor Name'
FROM actor;
-- 2a. You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe." What is one query would you use to obtain this information?
Select actor_id, first_name, last_name
FROM actor
WHERE first_name = 'JOE';
-- 2b. Find all actors whose last name contain the letters GEN:
Select actor_id, first_name, last_name
from actor 
Where last_name like '%GEN%';
-- 2c. Find all actors whose last names contain the letters LI. This time, order the rows by last name and first name, in that order:
Select actor_id, first_name, last_name
From actor
Where last_name LIKE '%LI%'
order by last_name, first_name;
-- 2d. Using IN, display the country_id and country columns of the following countries: Afghanistan, Bangladesh, and China:
Select country_id, country
From country
Where country in ('Afghanistan', 'Bangladesh', 'China');

-- 3a. Add a middle_name column to the table actor. Position it between first_name and last_name. Hint: you will need to specify the data type.
Select*from actor;
alter table actor
add column middle_name varchar(50) after first_name;

-- 3b. You realize that some of these actors have tremendously long last names. Change the data type of the middle_name column to blobs.
Alter table actor
modify column middle_name BLOB;
-- 3c. Now delete the middle_name column.
ALTER table actor
drop column middle_name;
-- 4a. List the last names of actors, as well as how many actors have that last name.
Select last_name, Count(*) AS 'Count'
From actor
GROUP BY last_name;
-- 4b. List last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors
Select last_name, Count(*) AS 'Count'
From actor
Group By last_name
Having Count > 2;

-- 4c. Oh, no! The actor HARPO WILLIAMS was accidentally entered in the actor table as GROUCHO WILLIAMS, the name of Harpo's second cousin's husband's yoga teacher. Write a query to fix the record.
Update actor
SET first_name = 'HARPO'
Where first_name = 'GROUCHO' AND last_name = 'WILLIAMS';
-- 4d. Perhaps we were too hasty in changing GROUCHO to HARPO. It turns out that GROUCHO was the correct name after all! In a single query, if the first name of the actor is currently HARPO, change it to GROUCHO. Otherwise, change the first name to MUCHO GROUCHO, as that is exactly what the actor will be with the grievous error. BE CAREFUL NOT TO CHANGE THE FIRST NAME OF EVERY ACTOR TO MUCHO GROUCHO, HOWEVER! (Hint: update the record using a unique identifier.)
Update actor
Set first_name = 'GROUCHO'
Where first_name='HARPO' AND last_name='WILLIAMS';
-- 5a. You cannot locate the schema of the address table. Which query would you use to re-create it?
 -- describe sakila.address 

-- 6a. Use JOIN to display the first and last names, as well as the address, of each staff member. Use the tables staff and address:
select s.first_name, s.last_name, a.address
From staff s left join address a on s.address_id = a.address_id;
-- 6b. Use JOIN to display the total amount rung up by each staff member in August of 2005. Use tables staff and payment.
Select s.first_name, s.last_name, SUM(p.amount) AS 'TOTAL'
From staff s LEFT JOIN payment p ON s.staff_id = p.staff_id
Group by s.first_name, s.last_name;

-- 6c. List each film and the number of actors who are listed for that film. Use tables film_actor and film. Use inner join.
Select f.title, Count(a.actor_id) AS 'TOTAL'
From film f Left join film_actor a ON f.film_id = a.film_id
Group by f.title;
-- 6d. How many copies of the film Hunchback Impossible exist in the inventory system?
 -- 2
-- 6e. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name:
select c.first_name, c.last_name, SUM(p.amount) as 'total'
From customer c left join payment p on c.customer_id = p.customer_id
group by c.first_name, c.last_name
order by c.last_name
	-- ![Total amount paid](Images/total_payment.png)
-- 7a. The music of Queen and Kris Kristofferson have seen an unlikely resurgence. As an unintended consequence, films starting with the letters K and Q have also soared in popularity. Use subqueries to display the titles of movies starting with the letters K and Q whose language is English.
Use sakila 
select title 
from film
where (title like 'K%' or title like 'Q%')
and language_id = (select language_id from language where name='English')
-- 7b. Use subqueries to display all actors who appear in the film Alone Trip.
Select first_name, last_name
from actor
where actor_id
	in (select actor_id from film_actor where film_id
		in (select film_id from film where title='ALONE TRIP')) 
-- 7c. You want to run an email marketing campaign in Canada, for which you will need the names and email addresses of all Canadian customers. Use joins to retrieve this information.
select first_name, last_name, email
from customer cu
join address a ON (cu.address_id = a.address_id)
join city cit on (a.city_id=city_id)
join city cit on (a.city_id=city.city_id)
join country ctry on (cit.country_id=ctry.country_id

-- 7d. Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as famiy films.

-- 7e. Display the most frequently rented movies in descending order.

-- 7f. Write a query to display how much business, in dollars, each store brought in.

-- 7g. Write a query to display for each store its store ID, city, and country.

-- 7h. List the top five genres in gross revenue in descending order. (Hint: you may need to use the following tables: category, film_category, inventory, payment, and rental.)

-- 8a. In your new role as an executive, you would like to have an easy way of viewing the Top five genres by gross revenue. Use the solution from the problem above to create a view. If you haven't solved 7h, you can substitute another query to create a view.

-- 8b. How would you display the view that you created in 8a?

-- 8c. You find that you no longer need the view top_five_genres. Write a query to delete it.
