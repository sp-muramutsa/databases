CREATE TABLE "ingredients" (
    "id" INTEGER,
    "name" TEXT,
    "pay_per_unit" NUMERIC,
    PRIMARY KEY("id")
);

CREATE TABLE "donuts" (
    "name" INTEGER,
    "gluten_status" TEXT CHECK("gluten_status" IN ("Free", "Not Free")),
    "price" NUMERIC,
    "ingredient" TEXT,
    PRIMARY KEY("name"),
    FOREIGN KEY("ingredient") REFERENCES "ingredients"("name")
);

CREATE TABLE "orders" (
    "order_number" INTEGER,
    "donut_id" INTEGER,
    "customer_id" INTEGER,
    PRIMARY KEY("order_number"),
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id"),
    FOREIGN KEY("customer_id") REFERENCES "customers"("id")
);

CREATE TABLE "customer" (
    "id" INTEGER,
    "first_name" TEXT,
    "second_name" TEXT,
    "order_history" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("order_history") REFERENCES "orders"("order_number")
);
