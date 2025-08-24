SELECT 
    card_type,
    COUNT(*) AS total_cards,
    COUNT(*) FILTER (WHERE churn_date IS NOT NULL) AS churned_cards,
    ROUND(COUNT(*) FILTER (WHERE churn_date IS NOT NULL) * 100.0 / COUNT(*), 0) AS churn_percent
FROM cards
GROUP BY card_type;