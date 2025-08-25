WITH ranked_salaries AS (
    SELECT 
        country,
        gender,
        salary,
        ROW_NUMBER() OVER (PARTITION BY country ORDER BY salary DESC) AS rank
    FROM clients
)
SELECT country
FROM (
    SELECT 
        country,
        COUNT(*) FILTER (WHERE gender = 'female') AS female_top,
        COUNT(*) AS total_top
    FROM ranked_salaries
    WHERE rank <= 10
    GROUP BY country
) t
WHERE female_top > total_top / 2;