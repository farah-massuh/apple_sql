/*----------
For each store, identify the best-selling day based on the highest quantity sold.
------------*/
SELECT *
FROM (
    SELECT
        store_id,
        TO_CHAR(sale_date, 'Day') day_name,
        SUM(quantity) total_unit_sold,
        RANK() OVER(PARTITION BY store_id ORDER BY SUM(quantity) DESC) rank
    FROM sales
    GROUP BY 1, 2
)
WHERE rank = 1

-- inner query works to rank based on quantity, grouping store_id and day
-- outer query finds rank 1 for each store