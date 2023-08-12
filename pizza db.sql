SELECT * from pizza_sales_excel_file

SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_value FROM pizza_sales_excel_file

SELECT SUM(quantity) AS Total_Pizza_Sold FROM pizza_sales_excel_file

SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales_excel_file

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2))
AS DECIMAL(10,2)) AS Avg_Pizza_Per_Order from pizza_sales_excel_file

SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS Total_orders FROM pizza_sales_excel_file
GROUP BY DATENAME(DW, order_date)

SELECT DATENAME(MONTH, order_date) AS Month_Name, COUNT(DISTINCT order_id) AS Total_orders FROM pizza_sales_excel_file
GROUP BY DATENAME(MONTH, order_date)

SELECT pizza_category, SUM(total_price) AS Total_Sales, SUM(total_price) * 100 / (SELECT SUM(total_price) 
from pizza_sales_excel_file WHERE MONTH(order_date) = 1) AS PCT
FROM pizza_sales_excel_file 
WHERE MONTH(order_date) = 1
GROUP BY pizza_category

SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Sales, 
CAST (SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales_excel_file) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales_excel_file 
GROUP BY pizza_size
ORDER BY PCT DESC

SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue FROM pizza_sales_excel_file
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue FROM pizza_sales_excel_file
GROUP BY pizza_name
ORDER BY Total_Revenue ASC

SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales_excel_file
GROUP BY pizza_name
ORDER BY Total_Orders DESC

SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales_excel_file
GROUP BY pizza_name
ORDER BY Total_Orders ASC

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Quantity FROM pizza_sales_excel_file
GROUP BY pizza_name
ORDER BY Total_Quantity DESC 

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Quantity FROM pizza_sales_excel_file
GROUP BY pizza_name
ORDER BY Total_Quantity ASC