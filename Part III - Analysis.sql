-- 1. Combine the menu_items and order_details tables into a single table.
SELECT *
FROM order_details as od
LEFT JOIN menu_items as mi
	on od.item_id = mi.menu_item_id;


-- 2. What were the least and most ordered items? What categories were they in?
SELECT item_name, category, COUNT(*) as num_item
FROM order_details as od
LEFT JOIN menu_items as mi
	on od.item_id = mi.menu_item_id
GROUP by 1, 2
ORDER by 3;

SELECT item_name, category, COUNT(*) as num_item
FROM order_details as od
LEFT JOIN menu_items as mi
	on od.item_id = mi.menu_item_id
GROUP by 1, 2
ORDER by 3 desc;

-- 3. What were the top 5 orders that spend the most money?
SELECT order_id, sum(price) as spent
FROM order_details as od
LEFT JOIN menu_items as mi
	on od.item_id = mi.menu_item_id
GROUP by 1
ORDER by 2 desc
LIMIT 5;
    
-- 4. View the details of the highest spend order. What insights can you gather from the results?
SELECT category, COUNT(item_id) as num_items
FROM menu_items as menu
JOIN order_details as orderd
	on menu.menu_item_id = orderd.item_id
WHERE order_id = 440
GROUP BY 1;

-- 5. View the details of the top 5 highest spend orders. What insights can you gather from the results?
SELECT order_id, category, COUNT(item_id) as num_items
FROM menu_items as menu
JOIN order_details as orderd
	on menu.menu_item_id = orderd.item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY order_id, category;

