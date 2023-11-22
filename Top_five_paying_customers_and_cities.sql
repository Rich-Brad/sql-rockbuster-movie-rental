-- Finding the top five paying customers in the top five cities in the top counties.
-- Did an inner join with customer, address, city, country, grouped by cust_id, first_name, last_name, city, and country
-- Order by sum(amount) desc to rank highest to lowest paying customers.

WITH total_amount_paid_cte(customer_id,amount,
			  first_name, last_name, city, country) AS
	(SELECT A.customer_id AS cust_id,SUM(amount) AS amount,
		B.first_name,
		B.last_name,
		D.city,
		E.country
	FROM payment A
	INNER JOIN customer B ON A.customer_id = B.customer_id
	INNER JOIN address C ON B.address_id = C.address_id
	INNER JOIN city D ON C.city_id = D.city_id
	INNER JOIN country E ON D.country_id = E.country_id
	WHERE city IN ('Aurora', 'Acua', 'Citrus Heights', 'Iwaki', 'Ambattur',
			  'Shanwei', 'So Leopoldo', 'Teboksary', 'Tianjin', 'Cianjur')
	GROUP BY cust_id,first_name,last_name,city,country
	ORDER BY SUM(amount) DESC
	LIMIT 5)
SELECT customer_id,amount,first_name,last_name,city,country
FROM total_amount_paid_cte
