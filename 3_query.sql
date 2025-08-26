SELECT 
    card_type,
    ROUND(COUNT(*) FILTER (WHERE churn_date IS NOT NULL) * 100.0 / COUNT(*), 0) AS churn_percent
FROM cards
GROUP BY card_type;