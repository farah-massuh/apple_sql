-- stores
\copy stores FROM '/Users/farahmassuh/Desktop/apple_sql/csv_files/stores.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

-- category
\copy category FROM '/Users/farahmassuh/Desktop/apple_sql/csv_files/category.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

-- products
\copy products FROM '/Users/farahmassuh/Desktop/apple_sql/csv_files/products.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

-- sales
\copy sales FROM '/Users/farahmassuh/Desktop/apple_sql/csv_files/sales.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

-- warranty
\copy warranty FROM '/Users/farahmassuh/Desktop/apple_sql/csv_files/warranty.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

-- EDA
SELECT DISTINCT repair_status FROM warranty;
SELECT COUNT(*) FROM sales;

-- Improving Query Performance
CREATE INDEX sales_product_id ON sales(product_id);
CREATE INDEX sales_store_id ON sales(store_id);
CREATE INDEX sales_sale_date ON sales(sale_date);

EXPLAIN ANALYZE
SELECT * FROM sales
WHERE product_id = 'P-44'
