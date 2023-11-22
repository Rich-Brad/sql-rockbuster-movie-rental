-- Query to find the top ten counties for Rockbuster in terms of customer numbers, using "group by", "order by", and "inner join".

SELECT country,city,
	COUNT(*)
FROM customer A
INNER JOIN address B ON A. address_id = B. address_id
INNER JOIN city C ON B. city_id = C. city_id
INNER JOIN country D ON C. country_id = D. country_id
WHERE country IN ('India', 'China', 'United States', 'Japan', 'Mexico',
				 'Brazil', 'Russian Federation', 'Philippines', 'Turkey', 'Indonesia')
GROUP BY country, city
ORDER BY COUNT(*) DESC
LIMIT 10;	

