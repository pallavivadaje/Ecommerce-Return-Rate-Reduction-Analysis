CREATE DATABASE ecommerce_analysis;

use ecommerce_analysis;

SELECT * FROM ecommerce;

-- COUNT TOTAL RECORDS
SELECT COUNT(*) AS Total_Records
FROM ecommerce;

-- VIEW ALL COLUMNS
DESCRIBE ecommerce;

-- DISTINCT PRODUCT CATEGORIES
SELECT DISTINCT Product_Category
FROM ecommerce;

-- DISTINCT SHIPPING METHODS
SELECT DISTINCT Shipping_Method
FROM ecommerce;

-- DISTINCT PAYMENT METHOD
SELECT DISTINCT Payment_Method
FROM ecommerce;

-- CHECK NULL VALUES
SELECT
SUM(Order_ID IS NULL) AS Order_ID,
SUM(Product_ID IS NULL) AS Product_ID,
SUM(User_ID IS NULL) AS User_ID,
SUM(Product_Category IS NULL) AS Product_Category
FROM ecommerce;

-- CHECK DUPLICATE ORDERS
SELECT Order_ID,
COUNT(*)
FROM ecommerce
GROUP BY Order_ID
HAVING COUNT(*) > 1;

-- CHECK NEGATIVE PROFIT
SELECT *
FROM ecommerce
WHERE Profit_Loss < 0;

-- CHECK RETURNED ORDERS
SELECT *
FROM ecommerce
WHERE Return_Status='Returned';

-- Exploratory Data Analysis (EDA)

-- TOTAL ORDERS
SELECT COUNT(DISTINCT Order_ID) AS Total_Orders
FROM ecommerce;

-- TOTAL REVENUE
SELECT ROUND(SUM(Order_Value),2) AS Total_Revenue
FROM ecommerce;

-- TOTAL PROFIT
SELECT ROUND(SUM(Profit_Loss),2) AS Total_Profit
FROM ecommerce;

-- AVERAGE ORDER value
SELECT ROUND(AVG(Order_Value),2) AS Average_Order_Value
FROM ecommerce;

-- REVENUE BY PRODUCT CATEGORY
SELECT Product_Category,
ROUND(SUM(Order_Value),2) AS Revenue
FROM ecommerce
GROUP BY Product_Category
ORDER BY Revenue DESC;

-- PROFIT BY PRODUCT CATEGORY
SELECT Product_Category,
ROUND(SUM(Profit_Loss),2) AS Profit
FROM ecommerce
GROUP BY Product_Category
ORDER BY Profit DESC;

-- ORDERS BY SHIPPING METHOD
SELECT Shipping_Method,
COUNT(*) AS Orders
FROM ecommerce
GROUP BY Shipping_Method
ORDER BY Orders DESC;

-- ORDERS BY PAYMENT METHOD
SELECT Payment_Method,
COUNT(*) AS Total
FROM ecommerce
GROUP BY Payment_Method
ORDER BY Total DESC;

-- GENDER DISTRIBUTION
SELECT User_Gender,
COUNT(*) AS Customers
FROM ecommerce
GROUP BY User_Gender;

-- TOP 10 LOCATIONS
SELECT User_Location,
COUNT(*) AS Orders
FROM ecommerce
GROUP BY User_Location
ORDER BY Orders DESC
LIMIT 10;

-- MONTHLY REVENUE
SELECT
MONTHNAME(Order_Date) AS Month,
ROUND(SUM(Order_Value),2) AS Revenue
FROM ecommerce
GROUP BY MONTH(Order_Date), MONTHNAME(Order_Date)
ORDER BY MONTH(Order_Date);

-- RETURN STATUS
SELECT Return_Status,
COUNT(*) AS Orders
FROM ecommerce
GROUP BY Return_Status;

-- RETURN REASONS
SELECT Return_Reason,
COUNT(*) AS Total_Returns
FROM ecommerce
GROUP BY Return_Reason
ORDER BY Total_Returns DESC;

-- AVERAGE DAYS TO RETURN
SELECT ROUND(AVG(Days_to_Return),2) AS Average_Days
FROM ecommerce
WHERE Return_Status='Returned';

-- AVERAGE PRODUCT PRICE BY CATEGORY
SELECT Product_Category,
ROUND(AVG(Product_Price),2) AS Average_Price
FROM ecommerce
GROUP BY Product_Category;

-- TOTAL RETURN COST
SELECT ROUND(SUM(Return_Cost),2) AS Total_Return_Cost
FROM ecommerce;

-- SUSTAINABILITY METRICS
SELECT
ROUND(SUM(CO2_Emissions),2) AS Total_CO2_Emissions,
ROUND(SUM(CO2_Saved),2) AS Total_CO2_Saved,
ROUND(SUM(Packaging_Waste),2) AS Total_Packaging_Waste,
ROUND(SUM(Waste_Avoided),2) AS Total_Waste_Avoided
FROM ecommerce;

-- HIGHEST ORDER values
SELECT *
FROM ecommerce
ORDER BY Order_Value DESC
LIMIT 10;

-- TOP 10 MOST PROFITABLE ORDERS
SELECT Order_ID,
Product_Category,
Profit_Loss
FROM ecommerce
ORDER BY Profit_Loss DESC
LIMIT 10;

-- RETURN PERCENTAGE
SELECT ROUND((COUNT(CASE WHEN Return_Status='Returned' THEN 1 END)*100.0)/COUNT(*),2)
AS Return_Percentage
FROM ecommerce;

-- ORDERS BY YEAR
SELECT
YEAR(Order_Date) AS Year,
COUNT(*) AS Orders
FROM ecommerce
GROUP BY YEAR(Order_Date);

-- ORDERS BY MONTH
SELECT
MONTHNAME(Order_Date) AS Month,
COUNT(*) AS Orders
FROM ecommerce
GROUP BY MONTH(Order_Date), MONTHNAME(Order_Date)
ORDER BY MONTH(Order_Date);

-- ORDERS BY DAY
SELECT
DAYNAME(Order_Date) AS Day,
COUNT(*) AS Orders
FROM ecommerce
GROUP BY DAYNAME(Order_Date);

-- AVERAGE PROFIT
SELECT
AVG(Profit_Loss) AS Average_Profit
FROM ecommerce;

-- MAXIMUM ORDER values
SELECT
MAX(Order_Value) AS Highest_Order
FROM ecommerce;

-- MINIMUM PRODUCT PRICE
SELECT
MIN(Product_Price) AS Lowest_Price
FROM ecommerce;

-- PROFIT STATUS
SELECT
Order_ID,
Profit_Loss,
CASE
WHEN Profit_Loss >0 THEN 'Profit'
WHEN Profit_Loss <0 THEN 'Loss'
ELSE 'Break Even'
END AS Status
FROM ecommerce;

-- CATEGORIES ORDER BASED ON VALUES
SELECT
Order_ID,
Order_Value,
CASE
WHEN Order_Value >=1000 THEN 'High Value'
WHEN Order_Value BETWEEN 500 AND 999 THEN 'Medium Value'
ELSE 'Low Value'
END AS Order_Category
FROM ecommerce;