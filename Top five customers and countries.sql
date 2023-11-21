WITH top_5_customers_cte (customer_id,amount,first_name,last_name,city,country) AS
(SELECT A.customer_id AS cust_id,SUM(A.amount) AS total_amount_paid,
		B.first_name,
		B.last_name,
		D.city,
		E.country AS cntry
	FROM payment A
	INNER JOIN customer B ON A.customer_id = B.customer_id
	INNER JOIN address C ON B.address_id = C.address_id
	INNER JOIN city D ON C.city_id = D.city_id
	INNER JOIN country E ON D.country_id = E.country_id
	WHERE city IN ('Aurora', 'Acua', 'Citrus Heights', 'Iwaki', 'Ambattur',
			  'Shanwei', 'So Leopoldo', 'Teboksary', 'Tianjin', 'Cianjur')
	GROUP BY cust_id, first_name, last_name,city, country
 	ORDER BY SUM(A.amount) DESC
	LIMIT 5) 
--SELECT * FROM top_5_customers_cte
SELECT D.country, COUNT(DISTINCT A.customer_id) AS all_customer_count,
			    COUNT(DISTINCT top_5_customers_cte.customer_id) AS top_customer_count 
FROM customer A
INNER JOIN address B ON A.address_id = B.address_id
INNER JOIN city C ON B.city_id = C.city_id
INNER JOIN country D ON C.country_id = D.country_id
LEFT JOIN top_5_customers_cte ON D.country = top_5_customers_cte.country
LEFT JOIN (SELECT A.customer_id AS cust_id,SUM(A.amount) AS total_amount_paid,
B.first_name,
B.last_name,
D.city,
E.country AS cntry
FROM payment A
INNER JOIN customer B ON A.customer_id = B.customer_id
INNER JOIN address C ON B.address_id = C.address_id
INNER JOIN city D ON C.city_id = D.city_id
INNER JOIN country E ON D.country_id = E.country_id
WHERE city IN ('Aurora', 'Acua', 'Citrus Heights', 'Iwaki', 'Ambattur',
'Shanwei', 'So Leopoldo', 'Teboksary', 'Tianjin', 'Cianjur')
GROUP BY cust_id, first_name, last_name,city, country
ORDER BY SUM(amount) DESC
LIMIT 5) AS top_5_customers ON D.country = top_5_customers.cntry
GROUP BY D.country,top_5_customers_cte
ORDER BY COUNT(*) DESC
