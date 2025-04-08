/*----------
Determine how many stores have never had a warranty claim filed.
------------*/
SELECT COUNT(*) number_of_stores_with_no_warranty_claim_filed
FROM stores
WHERE store_id NOT IN (
    SELECT DISTINCT store_id
    FROM sales s
    RIGHT JOIN warranty w ON s.sale_id = w.sale_id
);