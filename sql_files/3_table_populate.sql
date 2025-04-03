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