/*----------
Identify the least selling product in each country based on total units sold.
------------*/
WITH product_rank AS (
    SELECT
        st.country,
        p.product_name,
        SUM(s.quantity) total_qty_sold,
        RANK() OVER(PARTITION BY st.country ORDER BY SUM(s.quantity)) rank
    FROM sales s
    JOIN stores st ON s.store_id = st.store_id
    JOIN products p ON s.product_id = p.product_id
    GROUP BY 1, 2
)

SELECT *
FROM product_rank
WHERE rank = 1;