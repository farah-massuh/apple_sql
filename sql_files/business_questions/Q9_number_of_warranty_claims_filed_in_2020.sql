/*----------
How many warranty claims were filed in 2020?
------------*/
SELECT COUNT(*) warranty_claim
FROM warranty
WHERE EXTRACT(YEAR FROM claim_date) = 2020;