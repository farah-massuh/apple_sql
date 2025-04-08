/*----------
Calculate the correlation between product price and warranty claims for products sold in the last five years, segmented by price range.
------------*/
SELECT
    CASE
        WHEN p.price < 500 THEN 'Affordable'
        WHEN p.price BETWEEN 500 AND 1000 THEN 'Mid-range Expensive'
        ELSE 'Expensive'
    END price_segement,
    COUNT(w.claim_id) total_claim
FROM warranty w
LEFT JOIN sales s ON w.sale_id = s.sale_id
JOIN products p ON p.product_id = s.product_id
WHERE claim_date >= CURRENT_DATE - INTERVAL '5 year'
GROUP BY 1
ORDER BY 2 DESC;