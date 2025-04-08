/*----------
Identify the product category with the most warranty claims filed in the last two years.
------------*/
SELECT
    c.category_name,
    COUNT(w.claim_id) total_claims
FROM warranty w
LEFT JOIN sales s ON w.sale_id = s.sale_id
JOIN products p ON p.product_id = s.product_id
JOIN category c ON c.category_id = p.category_id
WHERE w.claim_date >= CURRENT_DATE - INTERVAL '2 year'
GROUP BY 1;