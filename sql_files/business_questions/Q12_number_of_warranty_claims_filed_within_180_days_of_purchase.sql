/*----------
Calculate how many warranty claims were filed within 180 days of a product sale.
------------*/
SELECT COUNT(*) days_of_warranty_claims_filed_within_180
FROM warranty w
LEFT JOIN sales s ON s.sale_id = w.sale_id
WHERE (w.claim_date - s.sale_date) <= 180;