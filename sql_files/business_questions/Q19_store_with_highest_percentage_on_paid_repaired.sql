/*----------
Identify the store with the highest percentage of "Paid Repaired" claims relative to total claims filed.
------------*/
SELECT
    s.store_id,
    st.store_name,
    ROUND(COUNT(
        CASE WHEN w.repair_status = 'Paid Repaired' THEN 1 END) * 100.0 
        / COUNT(w.claim_id
    ), 2) AS paid_repaired_percentage
FROM sales s
JOIN warranty w ON w.sale_id = s.sale_id
JOIN stores st ON st.store_id = s.store_id
GROUP BY 1, 2
ORDER BY 3 DESC
LIMIT 1;