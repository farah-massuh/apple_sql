/*----------
Identify which store had the highest total units sold in the last year.
------------*/
SELECT
    s.store_id,
    st.store_name,
    SUM(s.quantity)
FROM sales s
JOIN stores st ON s.store_id = st.store_id
WHERE sale_date >= (CURRENT_DATE - INTERVAL '1 year')
GROUP BY 1, 2
ORDER BY 3 DESC
LIMIT 1;