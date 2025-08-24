SELECT country, ROUND(AVG(credit_score)) AS avg_credit_score
FROM clients
GROUP BY country;