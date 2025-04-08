/*----------
Calculate the percentage of warranty claims marked as "Warranty Void"
------------*/
SELECT
    ROUND(
        COUNT(*)::NUMERIC / (SELECT COUNT(*) FROM warranty)::NUMERIC * 100,
        2
    ) AS warranty_void_percentage
FROM warranty
WHERE repair_status = 'Warranty Void';
