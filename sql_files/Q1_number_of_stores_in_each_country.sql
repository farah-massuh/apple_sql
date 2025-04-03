/*----------
1. Find the number of stores in each country.
------------*/
SELECT
    country,
    COUNT(*) number_of_stores
FROM stores
GROUP BY 1
ORDER BY 2 DESC;