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

SELECT index, sales_id, email, age, address, country, phone, product, quantity, status FROM sales_records LIMIT 5;

-- Dropping unnecessary table versions
-- DROP table sales_records;
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
SELECT COUNT(*) FROM
(SELECT 
    email,
    COUNT(*) AS duplicates 
FROM sales_records 
GROUP BY 
    email
HAVING COUNT(*) > 1
ORDER BY duplicates DESC
LIMIT 5);

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

-- Check for uniqueness on name 
-- and age columns combined
SELECT 
    name,
    age,
    COUNT(*) AS duplicates 
FROM sales_records 
GROUP BY 
    age, name
HAVING COUNT(*) > 1
ORDER BY duplicates DESC 
LIMIT 5;

-- Check for uniqueness on name 
-- and age columns combined
SELECT 
    name,
    email,
    COUNT(*) AS duplicates 
FROM sales_records 
GROUP BY 
    email, name
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
    user_id INTEGER SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR (255) NOT NULL,
    email VARCHAR (255) NOT NULL,
    age INTEGER,
    phone VARCHAR (25) NOT NULL,
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
    sales_id INTEGER NOT NULL PRIMARY KEY,
    user_id INTEGER NOT NULL PRIMARY KEY,
    product_id INTEGER NOT NULL,
    quantity INTEGER,
    status VARCHAR (20),
    order_date DATE,
    delivery_date DATE,
    CONSTRAINT fkey_product_id
        FOREIGN KEY(product_id)
            REFERENCES products(product_id)
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


CREATE TABLE temp (

    id INTEGER,
    price NUMERIC

);

COPY temp(id, price)
FROM 'C:\data\prices.csv'
DELIMITER ','
CSV;

-- Wrong
UPDATE products
SET price = 
(SELECT
    t.price
FROM products AS p
LEFT JOIN temp AS t
ON p.product_id = t.id)
WHERE product_id = id;

UPDATE products AS p
SET price = t.price
FROM temp AS t
WHERE p.product_id = t.id;

ALTER TABLE products
RENAME price TO price_in_pounds;

SELECT OBJECT_NAME(OBJECT_ID) AS NameofConstraint
FROM sys.objects
WHERE OBJECT_NAME(parent_object_id)='Person'
AND type_desc LIKE '%CONSTRAINT'

SELECT
    conname AS constraint_name,
    CASE contype
        WHEN 'p' THEN 'PRIMARY KEY'
        WHEN 'f' THEN 'FOREIGN KEY'
        WHEN 'u' THEN 'UNIQUE'
        WHEN 'c' THEN 'CHECK'
        ELSE 'OTHER'
    END AS constraint_type
FROM
    pg_constraint
WHERE
    conrelid = 'sales'::regclass;


SELECT
    *
FROM
    pg_constraint
WHERE
    conrelid = 'products'::regclass;


-- Wrong
ALTER TABLE products
ADD CONSTRAINT PRIMARY KEY TO product_id;


-- Inserting data into sales table
INSERT INTO sales (sales_id, product_id)
SELECT 
    DISTINCT(s.sales_id), 
    p.product_id 
FROM sales_records AS s
LEFT JOIN products as p
ON s.product = p.product_name;


-- Checks on validity of the information
SELECT 
    *
FROM sales_records 
WHERE sales_id = 139690;

SELECT 
    *
FROM products 
WHERE product_name IN ('Iphone 15 pro', 'Samsung S24+');

-- Correct
UPDATE sales AS sa
SET quantity = sr.quantity
FROM sales_records AS sr
WHERE sa.sales_id = sr.sales_id;


UPDATE sales AS sa
SET status = sr.status
FROM sales_records AS sr
WHERE sa.sales_id = sr.sales_id;

UPDATE sales AS sa
SET order_date = sr.order_date
FROM sales_records AS sr
WHERE sa.sales_id = sr.sales_id;


UPDATE sales AS sa
SET delivery_date = ( 
    CASE
        WHEN sr.status = 'Delivered' THEN sr.delivery_date
        ELSE NULL
    END
)
FROM sales_records AS sr
WHERE sa.sales_id = sr.sales_id;

SELECT 
    * 
FROM sales 
WHERE status <> 'Delivered'
LIMIT 5;

SELECT 
    delivery_date
FROM sales_records
WHERE status = 'Cancelled'
LIMIT 5;

pg_dump transactions > transactions.sql 

-- Make user_id serial 
ALTER TABLE users
ALTER COLUMN user_id ADD CONSTRAINT user_id SERIAL;

-- First, create the sequence
CREATE SEQUENCE user_id_seq;

-- Then, associate the sequence with the existing column
ALTER TABLE users
ALTER COLUMN user_id SET DEFAULT nextval('user_id_seq');

-- Finally, ensure that the sequence's next value is higher than the current max value in the column
SELECT setval('user_id_seq', COALESCE((SELECT MAX(user_id) FROM users), 1));

-- Deleting sequence
-- Wrong
DELETE SEQUENCE 'user_id_seq';
DROP SEQUENCE user_id_seq;


SELECT
    conname AS constraint_name,
    CASE contype
        WHEN 'p' THEN 'PRIMARY KEY'
        WHEN 'f' THEN 'FOREIGN KEY'
        WHEN 'u' THEN 'UNIQUE'
        WHEN 'c' THEN 'CHECK'
        ELSE 'OTHER'
    END AS constraint_type
FROM
    pg_constraint
WHERE
    conrelid = 'users'::regclass;


-- Increase phone length
ALTER TABLE users
ALTER COLUMN phone TYPE varchar(25);

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR (255) NOT NULL,
    email VARCHAR (255) NOT NULL,
    age INTEGER,
    phone VARCHAR (25) NOT NULL,
    address TEXT,
    country VARCHAR
);

-- Inserting values from sales_records to users
INSERT INTO users(name, email, age, phone, address, country)
SELECT 
    name,
    email,
    age,
    phone,
    address,
    country
FROM sales_records;

SELECT * FROM users LIMIT 5;

-- Show data types or table info
\d tablename;

SELECT
    conname,
    contype
FROM pg_constraint
WHERE conrelid = 'users'::regclass;

CREATE SEQUENCE seq;

ALTER TABLE users
ALTER COLUMN user_id SET DEFAULT nextval('seq')

SELECT setval(('seq'), (COALESCE(SELECT MAX(user_id) FROM users), 1))

SELECT
    name,
    email,
    age,
    COUNT(*) AS duplicates
FROM users
GROUP BY name, email, age
HAVING COUNT(*) >= 1
ORDER BY duplicates DESC
LIMIT 5;


-- Convert user_id to str and append 0s behind each id to make 5


SELECT * FROM users WHERE name LIKE '%A';

SELECT
    COUNT(*)
FROM users
WHERE email LIKE '%@gmail.com';


SELECT 
    column_name,
    data_type AS col_type
FROM
    information_schema.columns
WHERE
    table_schema = 'public' AND
    table_name = 'sales' AND
    column_name = 'sales_id';

SELECT * FROM sales WHERE order_date BETWEEN '2022-01-01' AND '2022-12-31' LIMIT 5;

SELECT * FROM sales WHERE EXTRACT(YEAR FROM order_date) = '2022' LIMIT 5; -- Works perfectly
