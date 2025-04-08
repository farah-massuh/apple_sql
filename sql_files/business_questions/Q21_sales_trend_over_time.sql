/*----------
Analyze product sales trends over time, segmented into key periods: from launch to 6 months, 6-12 months, 12-18 months, and beyond 18 months.
------------*/
SELECT
    p.product_name,
    CASE
        WHEN s.sale_date BETWEEN p.launch_date AND p.launch_date + INTERVAL '6 month' THEN '0-6 months'
        WHEN s.sale_date BETWEEN p.launch_date + INTERVAL '6 month' AND p.launch_date + INTERVAL '12 month' THEN '6-12 months'
        WHEN s.sale_date BETWEEN p.launch_date + INTERVAL '12 month' AND p.launch_date + INTERVAL '18 month' THEN '12-18 months'
        WHEN s.sale_date > p.launch_date + INTERVAL '18 month' THEN 'Beyond 18 months'
    END product_sales_trend,
    SUM(s.quantity) total_quantity
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY 1, 2
ORDER BY 1, 3 DESC;