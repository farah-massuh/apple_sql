/*----------
Write a query to calculate the monthly running total of sales for each store over the past four years and compare trends during this period.
------------*/
WITH monthly_sales AS (
    SELECT
        store_id,
        EXTRACT(YEAR FROM sale_date) AS year,
        EXTRACT(MONTH FROM sale_date) AS month,
        SUM(p.price * s.quantity) total_revenue
    FROM sales s
    JOIN products p ON s.product_id = p.product_id
    GROUP BY 1, 2, 3
    ORDER BY 1, 2, 3
)
SELECT
    store_id,
    month,
    year,
    total_revenue,
    SUM(total_revenue) OVER(PARTITION BY store_id ORDER BY year, month) running_total
FROM monthly_sales