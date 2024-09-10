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
    sales_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER,
    status VARCHAR (20),
    order_date DATE,
    delivery_date DATE,
    CONSTRAINT sales_user_pkey
        PRIMARY KEY(sales_id, user_id)
    CONSTRAINT sales_id_fkey
        FOREIGN KEY(sales_id)
            REFERENCES sales_records(sales_id),
    CONSTRAINT user_id_fkey
        FOREIGN KEY(user_id)
            REFERENCES users(user_id),
    CONSTRAINT fkey_product_id
        FOREIGN KEY(product_id)
            REFERENCES products(product_id)
);

CREATE TABLE users1 (
    user_id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR (255) NOT NULL,
    email VARCHAR (255) NOT NULL,
    age INTEGER,
    phone VARCHAR (25) NOT NULL,
    address TEXT,
    country_id INTEGER,
    CONSTRAINT country_id_fkey
        FOREIGN KEY(country_id)
            REFERENCES countries(id)
);


CREATE TABLE countries (
    id SERIAL PRIMARY KEY,
    country VARCHAR (55) NOT NULL
);

CREATE TABLE temp (
    id INTEGER,
    price NUMERIC
);