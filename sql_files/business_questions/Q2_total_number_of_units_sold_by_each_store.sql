/*----------
Calculate the total number of units sold by each store.
------------*/
SELECT
    s.store_id,
    st.store_name,
    SUM(s.quantity) total_unit_sold
FROM sales s
JOIN stores st ON st.store_id = s.store_id
GROUP BY 1, 2
ORDER BY 3 DESC;