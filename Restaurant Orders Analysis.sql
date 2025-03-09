-- Objective 1: Explore the items table

-- 1. View the menu_items table and write a query to find the number of items on the menu

SELECT *
FROM menu_items;

SELECT
	count(*) as num_items
FROM menu_items;


-- 2. What are the least expensive items on the menu? and most expensive items on the menu?

SELECT 
		item_name,
        price
FROM menu_items
ORDER by price;

-- 3. What are the most expensive items on the menu?
SELECT 
		item_name,
        price
FROM menu_items
ORDER by price desc;

-- 4. How many Italian dishes are on the menu? 

SELECT 
		count(*) as num_italian_dishes
FROM menu_items
WHERE category = 'Italian';

-- 5. What are the least and most expensive Italian dishes on the menu?
SELECT distinct
		item_name,
		category,
        price
FROM menu_items
WHERE category = 'Italian'
ORDER by price;

-- 6. What are the most expensive Italian dishes on the menu?
SELECT distinct
		item_name,
		category,
        price
FROM menu_items
WHERE category = 'Italian'
ORDER by price desc;

/* 
7. How many dishes are in each category? What is the average dish price within each category?
*/
SELECT
		category,
		count(item_name) num_of_dishes,
        round(avg(price), 2) as avg_price_per_dish
FROM menu_items
GROUP by category
ORDER by num_of_dishes desc, avg_price_per_dish desc;

-- Objective 2: Explore the orders table

-- 1. View the order_details table. 
SELECT *
FROM order_details;

-- 2. What is the date range of the table?
SELECT 
		MIN(order_date) as first_date,
        MAX(order_date) as last_date
FROM order_details;

-- 3. How many orders were made within this date range? 
SELECT 
        count(distinct order_id) as num_orders
FROM order_details;

-- 4. How many items were ordered within this date range?
SELECT 
        count(*) as num_items
FROM order_details;

-- 5. Which orders had the most number of items?
SELECT 
        order_id as orders,
        count(item_id) as num_items
FROM order_details
GROUP by orders
ORDER by num_items DESC;

-- 6. How many orders had more than 12 items?
SELECT
	count(*)
FROM
		(SELECT 
			order_id as orders,
			count(item_id) as num_items
		FROM order_details
		GROUP by orders
		HAVING num_items > 12
		ORDER by num_items desc) as num_orders;
        
-- Objective 3: Analyze Customer Behavior

-- 1. Combine the menu_items and order_details tables into a single table
SELECT *
FROM order_details
	LEFT JOIN menu_items
		ON order_details.item_id = menu_items.menu_item_id;
        
-- 2a. What were the least and most ordered items? What categories were they in?
SELECT
		item_name,
        count(order_details_id) as num_items,
        category
FROM order_details
	LEFT JOIN menu_items
		ON order_details.item_id = menu_items.menu_item_id
GROUP by item_name, category
HAVING num_items > 0
ORDER by num_items
LIMIT 1;

-- 2b. What were the most ordered items? What categories were they in?
SELECT
		item_name,
        count(order_details_id) as num_items,
        category
FROM order_details
	LEFT JOIN menu_items
		ON order_details.item_id = menu_items.menu_item_id
GROUP by item_name, category
ORDER by num_items DESC
LIMIT 1;

-- 3. What were the top 5 orders that spent the most money?
SELECT 
		order_id,
		SUM(price) as spent
FROM order_details
	LEFT JOIN menu_items
		ON order_details.item_id = menu_items.menu_item_id
GROUP by order_id
ORDER BY spent desc
LIMIT 5;

-- 4. View the details of the highest spend order. Which specific items were purchased?
SELECT 
		category,
        count(item_id) as num_items
FROM order_details
	LEFT JOIN menu_items
		ON order_details.item_id = menu_items.menu_item_id
WHERE order_id = 440
GROUP by category
ORDER by num_items desc;

-- 5. View the details of the top 5 highest spend order. What insights can you gather?
SELECT 
		order_id,
        category,
        count(item_id) as num_items
FROM order_details
	LEFT JOIN menu_items
		ON order_details.item_id = menu_items.menu_item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675)
GROUP by order_id, category;