-- Finding the min, max and avg of the rental duration from the film table.

SELECT MIN(rental_duration) AS min_rental_duration,
		MAX(rental_duration) AS max_rental_duration,
		AVG(rental_duration) AS avg_rental_duration,
		MIN(rental_rate) AS min_rental_rate,
		MAX(rental_rate) AS max_rental_rate,
		AVG(rental_rate) AS avg_rental_rate,
		MIN(length) AS min_length,
		MAX(length)	AS max_length,
		AVG(length)	AS avg_length,
		MIN(replacement_cost) AS min_replacement_cost,
		MAX(replacement_cost) AS max_replacement_cost,
		AVG(replacement_cost) AS avg_replacement_cost
FROM film;
