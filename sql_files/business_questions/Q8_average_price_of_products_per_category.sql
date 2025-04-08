/*----------
Find the average price of products in each category.
------------*/
SELECT
    p.category_id,
    c.category_name,
    ROUND(AVG(p.price)::NUMERIC, 2) avg_price
FROM products p
JOIN category c ON c.category_id = p.category_id
GROUP BY 1, 2
ORDER BY 3 DESC;