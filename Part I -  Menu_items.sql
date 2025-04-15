USE restaurant_db;

-- 1. View the menu items table.
SELECT *
FROM menu_items;

-- 2. Find the number of items on the menu.
SELECT COUNT(*)
FROM menu_items;

-- 3. What are the least and most expensive items on the menu?
SELECT item_name, price
FROM menu_items
ORDER BY 2 DESC
LIMIT 1;

SELECT item_name, price
FROM menu_items
ORDER BY 2 
LIMIT 1;

-- 4. How many Italian dishes are on the menu?
SELECT COUNT(*)
FROM menu_items
WHERE category = 'Italian';

-- 5. What are the least and most expensive Italion dishes on the menu?
SELECT item_name, category, price
FROM menu_items
WHERE category = 'Italian'
ORDER BY 3
LIMIT 1;

SELECT item_name, category, price
FROM menu_items
WHERE category = 'Italian'
ORDER BY 3 DESC
LIMIT 1;

-- 6. How many dishes are in each category?
SELECT category, COUNT(*) as num_dishes
FROM menu_items
GROUP BY 1
ORDER by 2 DESC;

-- 7. What is the average dish price within each category?
SELECT category, ROUND(avg(price), 2) as avg_price
FROM menu_items
GROUP by 1
ORDER by 2 DESC;
