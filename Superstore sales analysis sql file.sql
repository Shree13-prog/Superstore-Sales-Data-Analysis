
SELECT * FROM superstore_sales;

-- 1. Total Sales
SELECT SUM(Sales) AS Total_Sales FROM superstore_sales;

-- 2. Total Profit
SELECT SUM(Profit) AS Total_Profit FROM superstore_sales;

-- 3. Monthly Sales Trend
SELECT DATE_TRUNC('month', Order_Date) AS Month, SUM(Sales) AS Monthly_Sales
FROM superstore_sales
GROUP BY Month
ORDER BY Month;

-- 4. Top 10 Products by Sales
SELECT Product_Name, SUM(Sales) AS Total_Sales
FROM superstore_sales
GROUP BY Product_Name
ORDER BY Total_Sales DESC
LIMIT 10;

-- 5. Sales by Region
SELECT Region, SUM(Sales) AS Sales, SUM(Profit) AS Profit
FROM superstore_sales
GROUP BY Region;

-- 6. Profit Margin by Category
SELECT Category,
       SUM(Sales) AS Total_Sales,
       SUM(Profit) AS Total_Profit,
       ROUND(SUM(Profit)/SUM(Sales)*100, 2) AS Profit_Margin_Percentage
FROM superstore_sales
GROUP BY Category;

-- 7. Average Order Value (AOV)
SELECT AVG(Sales) AS Average_Order_Value
FROM superstore_sales;

-- 8. Sales by Segment
SELECT Segment, COUNT(DISTINCT Customer_ID) AS Unique_Customers,
       SUM(Sales) AS Total_Sales
FROM superstore_sales
GROUP BY Segment;

-- 9. Year-on-Year Sales Comparison
SELECT EXTRACT(YEAR FROM Order_Date) AS Year, SUM(Sales) AS Total_Sales
FROM superstore_sales
GROUP BY Year
ORDER BY Year;

-- 10. Repeat Customers Count
SELECT Customer_ID, COUNT(Order_ID) AS Orders
FROM superstore_sales
GROUP BY Customer_ID
HAVING COUNT(Order_ID) > 1;

-- 11. Top Products by Profit per Category
SELECT Category, Product_Name, SUM(Profit) AS Profit,
       RANK() OVER(PARTITION BY Category ORDER BY SUM(Profit) DESC) AS Profit_Rank
FROM superstore_sales
GROUP BY Category, Product_Name
ORDER BY Category, Profit_Rank;

-- 12. Most Frequently Ordered Sub-Categories
SELECT Sub_Category, COUNT(*) AS Order_Count
FROM superstore_sales
GROUP BY Sub_Category
ORDER BY Order_Count DESC;

-- 13. Impact of Discount on Profit
SELECT Discount,
       COUNT(*) AS Orders,
       ROUND(AVG(Profit), 2) AS Avg_Profit,
       ROUND(AVG(Sales), 2) AS Avg_Sales
FROM superstore_sales
GROUP BY Discount
ORDER BY Discount;
