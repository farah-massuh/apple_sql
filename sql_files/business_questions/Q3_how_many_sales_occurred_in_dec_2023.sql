/*----------
Identify how many sales occurred in December 2023.
------------*/
SELECT COUNT(sale_id) total_sale
FROM sales
WHERE TO_CHAR(sale_date, 'MM-YYYY') = '12-2023';