# Restaurant Orders Analysis

## Table of Contents

- [Project Overview](#project-overview)
- [Data Sources](#data-sources)
- [Tools](#tools)
- [Exploration Data Analysis](#exploration-data-analysis)
- [Data Analysis](#data-analysis)
- [Results](#results)

### Project Overview

This data analysis project aims to provide insights into the sales performance of a restaurant over the first quarter in 2023. By analyzing various aspects of the sales
data, we seek to identify trends, make data-driven recommendations and gain a deeper understanding of the restaurant's performance.

### Data Sources

The primary dataset used for this analysis is from "menu_items.csv" and "order_details.csv" files, containing detailed information about each item and sale
made by the restaurant.

### Tools

- SQL - Data Analysis

### Exploration Data Analysis

EDA involved exploring the sales data to answer key questions, such as:

- What are the least and most expensive dishes on the menu?
- How many dishes are in each menu category and what is the average dish price within each category?
- What are the least and most ordered items and what categories were they in?

### Data Analysis

What were the most ordered items? What categories were they in?
```sql
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
```

What were the top 5 orders that spent the most money?
```sql
SELECT 
		order_id,
		SUM(price) as spent
FROM order_details
	LEFT JOIN menu_items
		ON order_details.item_id = menu_items.menu_item_id
GROUP by order_id
ORDER BY spent desc
LIMIT 5;
```

View the details of the highest spend order. Which specific items were purchased?
```sql
SELECT 
		category,
        count(item_id) as num_items
FROM order_details
	LEFT JOIN menu_items
		ON order_details.item_id = menu_items.menu_item_id
WHERE order_id = 440
GROUP by category
ORDER by num_items desc;
```

View the details of the top 5 highest spend order.
```sql
SELECT 
		order_id,
        category,
        count(item_id) as num_items
FROM order_details
	LEFT JOIN menu_items
		ON order_details.item_id = menu_items.menu_item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675)
GROUP by order_id, category;
```

### Results
The most ordered item on the menu were hamburgers. However, when evaluating the the most expensive food orders, italian food was the most commonly spent item. 

### Recommendations
From this database, the highest spend orders were primarily on italian food. The high priced italian food should remain on the menu since people are ordering them a lot
especially from the highest spent customers.

### Limitations
- This data covers only a 3 month timeframe
- The trends could change if analyzed in a different season
