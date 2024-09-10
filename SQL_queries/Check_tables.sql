-- Check for uniqueness on sales_id column
SELECT 
    COUNT(DISTINCT(sales_id)) 
FROM sales_records 
ORDER BY count LIMIT 10;

-- Check for uniqueness on sales_id 
-- and name columns combined
SELECT COUNT(*) FROM (
    SELECT 
        email,
        COUNT(*) AS duplicates 
    FROM sales_records 
    GROUP BY 
        email
    HAVING COUNT(*) > 1
    ORDER BY duplicates DESC
    LIMIT 5
);

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
    GROUP BY name, age
    HAVING COUNT(*) > 1
);