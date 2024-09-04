CREATE TABLE "products"(
    "product_id" INTEGER NOT NULL,
    "product_name" VARCHAR(255) NOT NULL,
    "price" DECIMAL(8, 2) NULL
);
ALTER TABLE
    "products" ADD PRIMARY KEY("product_id");
CREATE TABLE "sales"(
    "sales_id" INTEGER NOT NULL,
    "product_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "quantity" INTEGER NULL,
    "status" VARCHAR(20) NULL,
    "order_date" DATE NULL,
    "delivery_date" DATE NULL
);
ALTER TABLE
    "sales" ADD PRIMARY KEY("sales_id");
ALTER TABLE
    "sales" ADD PRIMARY KEY("product_id");
CREATE TABLE "countries"(
    "id" INTEGER NOT NULL,
    "country" VARCHAR(55) NOT NULL
);
ALTER TABLE
    "countries" ADD PRIMARY KEY("id");
CREATE TABLE "sales_records"(
    "index" INTEGER NOT NULL,
    "sales_id" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "age" INTEGER NULL,
    "address" TEXT NOT NULL,
    "country" VARCHAR(255) NOT NULL,
    "phone" VARCHAR(255) NOT NULL,
    "product" VARCHAR(255) NOT NULL,
    "status" VARCHAR(255) NOT NULL,
    "quantity" INTEGER NOT NULL,
    "price" BIGINT NOT NULL,
    "order_date" DATE NOT NULL,
    "delivery_date" DATE NULL
);
ALTER TABLE
    "sales_records" ADD PRIMARY KEY("index");
CREATE TABLE "users"(
    "user_id" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "age" INTEGER NULL,
    "phone" VARCHAR(25) NOT NULL,
    "address" TEXT NULL,
    "country_id" INTEGER NULL
);
ALTER TABLE
    "users" ADD PRIMARY KEY("user_id");
ALTER TABLE
    "products" ADD CONSTRAINT "products_product_id_foreign" FOREIGN KEY("product_id") REFERENCES "sales"("product_id");
ALTER TABLE
    "users" ADD CONSTRAINT "users_country_id_foreign" FOREIGN KEY("country_id") REFERENCES "countries"("id");
ALTER TABLE
    "sales" ADD CONSTRAINT "sales_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "users"("user_id");