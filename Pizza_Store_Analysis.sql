Create DATABASE Pizza_Store;

USE Pizza_Store;

SELECT * FROM pizza_sales;

-- KPI'S


SELECT CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Revenue
FROM pizza_sales;

SELECT SUM(total_price) / COUNT(DISTINCT order_id)  AS Average_Order_Value
FROM pizza_sales;

SELECT SUM(quantity) AS Total_Pizza_Sold
From pizza_sales;

SELECT COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales;

SELECT CAST(SUM(quantity) / COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS Average_Pizza_Per_Order
FROM pizza_sales;

-- Charts Requirments
SELECT * From pizza_sales;

SELECT 
    DATENAME(WEEKDAY, order_date) AS Order_Day,
    DATEPART(WEEKDAY, order_date) AS Order_Day_Num,
    COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY 
    DATENAME(WEEKDAY, order_date), 
    DATEPART(WEEKDAY, order_date)
ORDER BY 
    Order_Day_Num;


SELECT 
    YEAR(order_date) AS Order_Year,
    DATENAME(MONTH, order_date) AS Month_Name,
    DATEPART(MONTH, order_date) AS Month_Number,
    COUNT(DISTINCT order_id) AS Total_Orders
FROM Pizza_Store.pizza_sales
GROUP BY 
    YEAR(order_date),
    DATENAME(MONTH, order_date), 
    DATEPART(MONTH, order_date)
ORDER BY 
    Order_Year,
    Month_Number;


SELECT pizza_category, CAST(sum(total_price) *100 / (SELECT SUM(total_price) FROM Pizza_Store.pizza_sales) AS DECIMAL(10,2)) AS Sale_Percentage
FROM Pizza_Store.pizza_sales 
GROUP BY pizza_category;

SELECT pizza_size, CAST(sum(total_price) *100 / (SELECT SUM(total_price) FROM Pizza_Store.pizza_sales) AS DECIMAL(10,2)) AS Sale_Percentage
FROM Pizza_Store.pizza_sales 
GROUP BY pizza_size
ORDER BY Sale_Percentage;

SELECT pizza_name, cast(SUM(total_price) AS DECIMAL(10,2)) AS Total_Revenue
FROM Pizza_Store.pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
limit 5;

SELECT pizza_name, cast(SUM(total_price) AS DECIMAL(10,2)) AS Total_Revenue
FROM Pizza_Store.pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue
limit 10;

SELECT pizza_name, SUM(quantity) AS Total_Quantity
FROM Pizza_Store.pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC
limit 10;

SELECT pizza_name, SUM(quantity) AS Total_Quantity
FROM Pizza_Store.pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity
limit 5;

SELECT pizza_name, cast(COUNT(DISTiNCT order_id) AS DECIMAL(10,2)) AS Total_Ordered
FROM Pizza_Store.pizza_sales
GROUP BY pizza_name
ORDER BY Total_Ordered DESC
limit 5;

SELECT pizza_name, cast(COUNT(DISTiNCT order_id) AS DECIMAL(10,2)) AS Total_Ordered
FROM Pizza_Store.pizza_sales
GROUP BY pizza_name
ORDER BY Total_Ordered
limit 5;



