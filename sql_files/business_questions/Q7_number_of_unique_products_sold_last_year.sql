/*----------
Count the number of unique products sold in the last year.
------------*/
SELECT COUNT(DISTINCT product_id)
FROM sales
WHERE sale_date >= (CURRENT_DATE - INTERVAL '1 year');