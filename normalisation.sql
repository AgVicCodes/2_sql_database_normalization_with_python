-- Create the database
CREATE DATABASE transactions;

-- Create the sales_records table
CREATE TABLE sales_records (
    index SERIAL PRIMARY KEY,
    sales_id INTEGER NOT NULL,
    name VARCHAR (255) NOT NULL,
    email VARCHAR (255) NOT NULL,
    age INTEGER NOT NULL,
    address VARCHAR (255) NOT NULL,
    country VARCHAR (255) NOT NULL,
    phone VARCHAR (255) NOT NULL,
    product VARCHAR (255) NOT NULL,
    quantity INTEGER NOT NULL,
    status VARCHAR (255) NOT NULL,
    order_date DATE NOT NULL,
    delivery_date DATE
);

-- Test the table by inserting data
INSERT INTO 
    sales_records (sales_id, name, email, age, add
    ress, country, phone, product, quantity, status, order_date, delivery_date) 
    VALUES (122354, 'Leslie Hall', 'lesliehall@hotmail.com', 71, '701 Lisa Keys Apt. 336\nPaulburgh, IA 95420', 'Burundi', '+878799587692', 'Samsung S24', 1, 'Cancelled', '2023-08-21', '2023-08-24');

-- Dropping unnecessary table versions
DROP table sales_records;
-- DROP table sales_records1;
-- DROP table sales_records2;
-- DROP table sales_records3;

-- First SELECT test statement
SELECT * FROM sales_records LIMIT 10;

-- Check for uniqueness on sales_id column
SELECT 
    COUNT(DISTINCT(sales_id)) 
FROM sales_records 
ORDER BY count LIMIT 10;

-- Check for uniqueness on sales_id 
-- and name columns combined
SELECT 
    sales_id,
    name,
    COUNT(*) AS duplicates 
FROM sales_records 
GROUP BY 
    sales_id, name
HAVING COUNT(*) > 1
ORDER BY duplicates DESC 
LIMIT 5;

-- Wrong (Having comes before order by)
SELECT 
    name,
    sales_id, 
    COUNT(*) AS duplicates 
FROM sales_records 
GROUP BY 
    name,
    sales_id 
ORDER BY duplicates ASC 
HAVING duplicates > 1
LIMIT 5;

-- Checking for duplicates on column sales_id
SELECT 
    sales_id, 
    COUNT(*) AS duplicates 
FROM sales_records 
GROUP BY 
    sales_id 
HAVING COUNT(*) > 1
ORDER BY duplicates DESC 
LIMIT 5;

-- Checking for missing values on column sales_id
SELECT 
    COUNT(*)
    - COUNT(sales_id) AS missing
FROM sales_records;

/*  SELECT
        COUNT(*)
        - COUNT(DISTINCT(sales_id)) AS missing
    FROM sales_records;
    missing
    ---------
        854
*/

-- Checking for missing values on column sales_id
SELECT 
    COUNT(*)
    - COUNT(DISTINCT(phone)) AS phone_duplicates
FROM sales_records;

-- Checking for duplicates on name, 
-- age and email columns combined 
SELECT
*
FROM (
    SELECT
        name,
        age,
        COUNT(*) as dup
    FROM sales_records
    GROUP BY name, age
    HAVING COUNT(*) > 1
);

-- Creating the users dimension table
CREATE TABLE users (
    user_id INTEGER PRIMARY KEY NOT NULL,
    name VARCHAR (255) NOT NULL,
    email VARCHAR (255) NOT NULL,
    age INTEGER,
    phone VARCHAR (14) NOT NULL,
    address TEXT,
    country VARCHAR
);

-- Creating the product dimension table
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY NOT NULL,
    product_name VARCHAR (255) NOT NULL,
    price NUMERIC
);

-- Creating the sales fact table
CREATE TABLE sales (
    sales_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER,
    status VARCHAR (20),
    order_date DATE,
    delivery_date DATE
);

ALTER TABLE table_name
ADD COLUMN col type;

ALTER TABLE products
ALTER COLUMN product_id ADD CONSTRAINT SERIAL;

INSERT INTO products (product_name)
SELECT DISTINCT product 
FROM sales_records
ORDER BY product ASC;

ALTER TABLE products
TRUNCATE TABLE products;

UPDATE products 
SET price = 
    CASE
        WHEN product_name = 'Iphone 12' THEN 250
        WHEN product_name = 'Iphone 12 mini' THEN 225
        WHEN product_name = 'Iphone 12 pro max' THEN 400 
        WHEN product_name = 'Lenovo PC' THEN 750
        WHEN product_name = 'PS4' THEN 275
        WHEN product_name = 'PS5' THEN 400
        WHEN product_name = 'Samsung 24' THEN 850
        ELSE 999
    END;

SELECT 
    CASE
        WHEN product_name = 'Iphone 12' THEN 250
        WHEN product_name = 'Iphone 12 mini' THEN 225
        WHEN product_name = 'Iphone 12 pro max' THEN 400 
        WHEN product_name = 'Lenovo PC' THEN 750
        WHEN product_name = 'PS4' THEN 275
        WHEN product_name = 'PS5' THEN 400
        WHEN product_name = 'Samsung 24' THEN 850
        ELSE 999
    END as price
FROM products;

, "", "", 
                                  "Iphone 15", "Iphone 15 plus", 
                                  "", "", 
                                  "Iphone 12 pro", "Iphone 12 pro max", 
                                  "Iphone 14 pro", "Iphone 14 pro max", 
                                  "Iphone 15 pro", "Iphone 15 pro max", 
                                  "Iphone 13", "Iphone 13 pro", "Iphone 14", 
                                  "Samsung S21", "Samsung S21+", "Samsung S22", 
                                  "Samsung S24", "Samsung S24+", "Samsung S24 Ultra",
                                  "Samsung S22 Ultra", "Samsung S23+", "Samsung S23 Ultra"