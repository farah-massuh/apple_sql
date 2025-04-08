-- if tables already exist
DROP TABLE IF EXISTS stores;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS warranty;

-- table setups

CREATE TABLE stores
(
    store_id    VARCHAR(30) PRIMARY KEY,
    store_name  VARCHAR(30),
    city        VARCHAR(30),
    country     VARCHAR(30)

);

CREATE TABLE category
(
    category_id   VARCHAR(30) PRIMARY KEY,
    category_name VARCHAR(30)
);

CREATE TABLE products
(
    product_id      VARCHAR(30) PRIMARY KEY,
    product_name    VARCHAR(30),
    category_id	    VARCHAR(30), -- fk
    launch_date	    DATE,
    price           FLOAT,
    CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES category(category_id)
);

CREATE TABLE sales
(
    sale_id	    VARCHAR(30) PRIMARY KEY,
    sale_date	DATE,
    store_id	VARCHAR(30), -- fk
    product_id	VARCHAR(30), -- fk
    quantity    INT,
    CONSTRAINT fk_store FOREIGN KEY (store_id) REFERENCES stores(store_id),
    CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE warranty
(
claim_id        VARCHAR(30) PRIMARY KEY,	
claim_date	    DATE,
sale_id	        VARCHAR(30), -- fk
repair_status   VARCHAR(30),
CONSTRAINT fk_orders FOREIGN KEY (sale_id) REFERENCES sales(sale_id)
);

ALTER TABLE stores OWNER TO postgres;
ALTER TABLE category OWNER TO postgres;
ALTER TABLE products OWNER TO postgres;
ALTER TABLE sales OWNER TO postgres;
ALTER TABLE warranty OWNER TO postgres;

SELECT 'Schema created successful' success_message;