-- Create the primary sales_records table
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
        FOREIGN KEY(product_id);
            REFERENCES products(product_id);
);

CREATE TABLE temp (
    id INTEGER,
    price NUMERIC
);


CREATE TABLE users (
    user_id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR (255) NOT NULL,
    email VARCHAR (255) NOT NULL,
    age INTEGER,
    phone VARCHAR (25) NOT NULL,
    address TEXT,
    country VARCHAR
);


CREATE TABLE countries (
    id SERIAL PRIMARY KEY,
    country VARCHAR (55) NOT NULL
);