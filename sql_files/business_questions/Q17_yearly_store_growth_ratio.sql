/*----------
Analyze the year-by-year growth ratio for each store.
------------*/
WITH yearly_sales AS (
    SELECT
        s.store_id,
        st.store_name,
        EXTRACT(YEAR FROM sale_date) AS year,
        SUM(s.quantity * p.price) total_sale
    FROM sales s
    JOIN products p ON s.product_id = p.product_id
    JOIN stores st ON st.store_id = s.store_id
    GROUP BY 1, 2, 3
    ORDER BY 2, 3
),
current_and_last_yearly_sales AS (
    SELECT
        store_name,
        year,
        LAG(total_sale, 1) OVER(PARTITION BY store_name ORDER BY year) last_year_sale,
        total_sale as current_year_sale
    FROM yearly_sales
)
SELECT
    store_name,
    year,
    last_year_sale,
    current_year_sale,
    ROUND((current_year_sale - last_year_sale)::NUMERIC / last_year_sale::NUMERIC * 100, 3) as growth_ratio
FROM current_and_last_yearly_sales
WHERE 
    last_year_sale IS NOT NULL
    AND YEAR <> EXTRACT(YEAR FROM CURRENT_DATE);