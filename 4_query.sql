SELECT 
    id,
	name,
    salary,
    country,
    ROUND(salary - AVG(salary) OVER (PARTITION BY country),2) AS salary_diff
FROM clients;