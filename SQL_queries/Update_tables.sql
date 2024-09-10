COPY temp(id, price)
FROM 'C:\data\prices.csv'
DELIMITER ','
CSV; 

UPDATE products AS p
SET price = t.price
FROM temp AS t
WHERE p.product_id = t.id;