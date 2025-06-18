SELECT * FROM pizza_sales

SELECT SUM(total_price) AS Total_Revenue
FROM pizza_sales

SELECT SUM(total_price) / COUNT(DISTINCT Order_id) AS Avg_Order_Value
FROM pizza_sales

SELECT SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales

SELECT COUNT(DISTINCT order_id) AS Total_Order
FROM pizza_sales

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_Pizza_Order_Sale
FROM pizza_sales

SELECT DATENAME(DW, order_date) AS Order_Day,
COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)

SELECT DATENAME(MONTH, order_date) AS Month_Name,
COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date)

SELECT pizza_category,
CAST(SUM(total_price) AS DECIMAL (10,2)) AS Total_Revenue,
CAST(SUM(total_price) * 100 / (SELECT  SUM(total_price) FROM pizza_sales WHERE MONTH(order_date) = 2) AS DECIMAL (10,2)) AS PCT
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category

SELECT pizza_size,
CAST(SUM(total_price) AS DECIMAL (10,2)) AS Total_Revenue,
CAST(SUM(total_price) * 100 / (SELECT  SUM(total_price) FROM pizza_sales) AS DECIMAL (10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size

SELECT pizza_category, 
SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC

SELECT Top 5 pizza_name,
SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

SELECT Top 5 pizza_name,
SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC

SELECT Top 5 pizza_name,
SUM(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC

SELECT Top 5 pizza_name,
SUM(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity ASC

SELECT Top 5 pizza_name,
COUNT(DISTINCT order_id) AS Total_Order
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Order DESC

SELECT Top 5 pizza_name,
COUNT(DISTINCT order_id) AS Total_Order
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Order ASC




