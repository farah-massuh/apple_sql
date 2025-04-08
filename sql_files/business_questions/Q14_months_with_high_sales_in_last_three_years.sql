/*----------
List the months in the last three years where sales exceeded 5,000 units in the USA.
------------*/
SELECT
    TO_CHAR(sale_date, 'MM-YYYY') AS month,
    SUM(s.quantity) total_unit_sold
FROM sales s
JOIN stores st ON s.store_id = st.store_id
WHERE 
    st.country = 'USA' 
    AND s.sale_date >= CURRENT_DATE - INTERVAL '3 years'
GROUP BY 1
HAVING SUM(s.quantity) > 5000