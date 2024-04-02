
TASK 1
  
UPDATE "film"
SET "rental_duration" = 21,
"rental_rate" = 9.99
WHERE "title" = 'The Godfather';
SELECT * FROM "film"
WHERE "title" = 'The Godfather';
UPDATE "film"
SET "rental_duration" = 21,
"rental_rate" = 9.99
WHERE "film_id" = 1001;
SELECT * FROM "film"
WHERE "film_id" = 1001;

TASK 2

WITH "suitable_customer" AS(
SELECT "customer". "customer_id"
FROM "customer"
JOIN "rental" ON "customer"."customer_id" = "rental"."customer_id"
JOIN "payment" ON "customer"."customer_id" = "payment"."customer_id"
GROUP BY "customer"."customer_id"
HAVING COUNT (DISTINCT "rental"."rental_id") >= 10 AND COUNT (DISTINCT "payment"."payment_id") >= 10
LIMIT 1
)
UPDATE "customer"
SET "first_name" = 'Iroda', 
    "last_name" = 'Khikmatullaeva',
"address_id" = 2
FROM "suitable_customer"
WHERE "customer". "customer_id" = "suitable_customer"."customer_id";
SELECT * FROM "customer"
WHERE "first_name" = 'Iroda' AND
"last_name" = 'Khikmatullaeva' AND
"address_id" = 2;

TASK 3 

WITH "suitable_customer" AS (
SELECT "customer"."customer_id"
FROM "customer"
JOIN "rental" ON "customer"."customer_id" = "rental"."customer_id"
JOIN "payment" ON "customer"."customer_id" = "payment"."customer_id"
GROUP BY "customer"."customer_id"
HAVING COUNT (DISTINCT "rental"."rental_id")>= 10 AND COUNT(DISTINCT "payment"."payment_id") >= 10
LIMIT 1
	)
UPDATE "customer"
SET "create_date" = CURRENT_DATE
FROM "suitable_customer"
WHERE "customer"."customer_id" = "suitable_customer"."customer_id";
SELECT * FROM "customer"
WHERE "first_name" =
'Iroda' AND
"last_name" = 'Khikmatullaeva' AND
"address_id" = 2
