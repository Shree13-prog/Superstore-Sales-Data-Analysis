SELECT * FROM superstore_sales;

-- 1. Total Sales
SELECT SUM(Sales) AS Total_Sales FROM superstore_sales;

-- 2. Total Profit
SELECT SUM(Profit) AS Total_Profit FROM superstore_sales;

-- 3. Top 5 Products by Sales
SELECT Product_Name, SUM(Sales) AS Total_Sales
FROM superstore_sales
GROUP BY Product_Name
ORDER BY Total_Sales DESC
LIMIT 5;

-- 4. Sales by Region
SELECT Region, SUM(Sales) AS Sales, SUM(Profit) AS Profit
FROM superstore_sales
GROUP BY Region;

-- 5. Profit Margin by Category
SELECT Category,
       SUM(Sales) AS Total_Sales,
       SUM(Profit) AS Total_Profit,
       ROUND(SUM(Profit)/SUM(Sales)*100, 2) AS Profit_Margin_Percentage
FROM superstore_sales
GROUP BY Category;

-- 6. Average Order Value (AOV)
SELECT AVG(Sales) AS Average_Order_Value
FROM superstore_sales;

-- 7. Sales by Segment
SELECT Segment, COUNT(DISTINCT Customer_ID) AS Unique_Customers,
       SUM(Sales) AS Total_Sales
FROM superstore_sales
GROUP BY Segment;

-- 8. Year-on-Year Sales Comparison
SELECT EXTRACT(YEAR FROM Order_Date) AS Year, SUM(Sales) AS Total_Sales
FROM superstore_sales
GROUP BY Year
ORDER BY Year;

-- 9. Repeat customer count/Order frequency 
SELECT Customer_ID, COUNT(Order_ID) AS Orders
FROM superstore_sales
GROUP BY Customer_ID
HAVING COUNT(Order_ID) > 1;

-- 10. Most Frequently Ordered Sub-Categories
SELECT Sub_Category, COUNT(*) AS Order_Count
FROM superstore_sales
GROUP BY Sub_Category
ORDER BY Order_Count DESC;

