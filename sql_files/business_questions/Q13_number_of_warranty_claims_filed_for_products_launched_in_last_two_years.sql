/*----------
Determine how many warranty claims were filed for products launched in the last two years.
------------*/
SELECT
    p.product_name,
    COUNT(w.claim_id) num_claims,
    COUNT(s.sale_id) num_sales
FROM sales s
LEFT JOIN warranty w ON w.sale_id = s.sale_id
JOIN products p ON p.product_id = s.product_id
WHERE p.launch_date >= CURRENT_DATE - INTERVAL '2 years'
GROUP BY 1
HAVING COUNT(w.claim_date) > 0;