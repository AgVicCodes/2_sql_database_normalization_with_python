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
DROP table sales_records1;
DROP table sales_records2;
DROP table sales_records3;

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
    GROUP BY name,  age
    HAVING COUNT(*) > 1
);

-- Creating the users dimension table
CREATE TABLE users (
    user_id INTEGER PRIMARY KEY,
    name VARCHAR (255),
    email VARCHAR (255),
    age INTEGER,
    phone VARCHAR (14),
    address TEXT,
    country VARCHAR
);

-- Creating the product dimension table
CREATE TABLE product (
    product_id INTEGER,
    product_name VARCHAR (255),
    price NUMERIC
);

-- Creating the sales fact table
CREATE TABLE sales (
    sales_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    status VARCHAR (20),
    order_date DATE,
    delivery_date DATE
);

ALTER TABLE table_name
ADD COLUMN col type;

INSERT INTO SELECT DISTINCT
