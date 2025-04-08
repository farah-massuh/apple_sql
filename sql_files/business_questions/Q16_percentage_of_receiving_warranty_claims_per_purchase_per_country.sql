/*----------
Determine the percentage chance of receiving warranty claims after each purchase for each country.
------------*/
SELECT
    country,
    total_unit_sold,
    total_claim,
    -- ensures if division is 0 or NULL, returns 0 instead
    ROUND(COALESCE(total_claim::NUMERIC / total_unit_sold::NUMERIC * 100, 0), 2) risk
FROM (
    SELECT
        st.country,
        SUM(s.quantity) total_unit_sold,
        COUNT(w.claim_id) total_claim
    FROM sales s
    JOIN stores st ON s.store_id = st.store_id
    LEFT JOIN warranty w ON w.sale_id = s.sale_id
    GROUP BY 1
)
ORDER BY 4 DESC;