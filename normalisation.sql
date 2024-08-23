CREATE DATABASE transactions;

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

INSERT INTO 
    sales_records (sales_id, name, email, age, add
    ress, country, phone, product, quantity, status, order_date, delivery_date) 
    VALUES (122354, 'Leslie Hall', 'lesliehall@hotmail.com', 71, '701 Lisa Keys Apt. 336\nPaulburgh, IA 95420', 'Burundi', '+878799587692', 'Samsung S24', 1, 'Cancelled', '2023-08-21', '2023-08-24');

DROP table sales_records;
DROP table sales_records1;
DROP table sales_records2;
DROP table sales_records3;
