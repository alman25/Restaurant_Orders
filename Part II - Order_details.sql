-- 1. View the order_details table.
SELECT *
FROM order_details;

-- 2. What is the date range of the table?
SELECT min(order_date), max(order_date)
FROM order_details;

-- 3. How many orders were made within this date range?
SELECT COUNT(DISTINCT order_id) as num_orders
FROM order_details;

-- 4. How many items were ordered within this date range?
SELECT COUNT(*)
FROM order_details;

-- 5. Which orders had the most number of items?
SELECT order_id, COUNT(item_id) as num_items
FROM order_details
GROUP by 1
ORDER by 2 DESC
LIMIT 10;

-- 6. How many orders had more than 12 items?
SELECT count(*) as num_orders
FROM 
(
SELECT order_id, COUNT(item_id) as num_items
FROM order_details
GROUP by 1
HAVING num_items > 12
) as num
;