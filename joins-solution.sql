-- Question 1:
SELECT "first_name", "last_name", "street", "city", "state", "zip" 
FROM "customers"
JOIN "addresses" ON "addresses"."customer_id" = "customers"."id";

--Question 2:
SELECT * 
FROM "orders"
JOIN "line_items" ON "line_items"."order_id" = "orders"."id";

-- Question 3:
SELECT "description", "warehouse"
From "products"
JOIN "warehouse_product" ON "warehouse_product"."product_id" = "products"."id"
JOIN "warehouse" ON "warehouse"."id" = "warehouse_product"."warehouse_id"
WHERE "description" = 'cheetos';

--Question 4:
SELECT "description", "warehouse"
From "products"
JOIN "warehouse_product" ON "warehouse_product"."product_id" = "products"."id"
JOIN "warehouse" ON "warehouse"."id" = "warehouse_product"."warehouse_id"
WHERE "description" = 'diet pepsi';

--Question 5:
SELECT "first_name", COUNT(*)
FROM "customers"
JOIN "addresses" ON "addresses"."customer_id" = "customers"."id"
JOIN "orders" ON "orders"."address_id" = "addresses"."id"
GROUP BY "first_name";

--Question 6:
SELECT COUNT(*)
FROM "customers";

--Question 7:
SELECT COUNT(*)
FROM "products";

--Question 8:
SELECT "description", SUM("on_hand") 
FROM "products"
JOIN "warehouse_product" ON "warehouse_product"."product_id" = "products"."id"
JOIN "warehouse" ON "warehouse"."id" = "warehouse_product"."warehouse_id"
WHERE "description" = 'diet pepsi'
GROUP BY "description";

--STRETCH GOALS
--Question 9:
SELECT "orders"."order_date", SUM("products"."unit_price")
FROM "orders"
JOIN "line_items" ON "line_items"."order_id" = "orders"."id"
JOIN "products" ON "products"."id" = "line_items"."product_id"
GROUP BY "orders"."order_date";

--Question 10:
SELECT "first_name", SUM("unit_price")
FROM "customers"
JOIN "addresses" ON "addresses"."customer_id" = "customers"."id"
JOIN "orders" ON "orders"."address_id" = "addresses"."id"
JOIN "line_items" ON "line_items"."order_id" = "orders"."id"
JOIN "products" ON "products"."id" = "line_items"."product_id"
GROUP BY "first_name";

--Question 11:
SELECT "first_name", COALESCE(SUM("unit_price"), 0)
FROM "customers"
FULL OUTER JOIN "addresses" ON "addresses"."customer_id" = "customers"."id"
FULL OUTER JOIN "orders" ON "orders"."address_id" = "addresses"."id"
FULL OUTER JOIN "line_items" ON "line_items"."order_id" = "orders"."id"
FULL OUTER JOIN "products" ON "products"."id" = "line_items"."product_id"
GROUP BY "first_name";