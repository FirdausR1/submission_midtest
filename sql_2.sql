WITH item_counts AS (
    SELECT item, COUNT(*) AS total_purchase
    FROM item_bought
    GROUP BY item
),
extremes AS (
    SELECT 
        item,
        RANK() OVER (ORDER BY total_purchase ASC) AS least_rank,
        RANK() OVER (ORDER BY total_purchase DESC) AS most_rank
    FROM item_counts
)
SELECT item
FROM extremes
WHERE least_rank > 1 AND most_rank > 1;
