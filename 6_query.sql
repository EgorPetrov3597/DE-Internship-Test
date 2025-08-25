SELECT country
FROM (
    SELECT 
        c.country,
        ARRAY_AGG(DISTINCT card_type) AS existing_types
    FROM cards
    JOIN clients c ON cards.client_id = c.id
    GROUP BY c.country
) t
WHERE array_length(existing_types, 1) < (SELECT COUNT(DISTINCT card_type) FROM cards);