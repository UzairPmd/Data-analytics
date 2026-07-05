-- ==========================================
-- Walmart Sales Analysis Project
-- Author: Uzair
-- ==========================================

-- Create and select the database
CREATE DATABASE IF NOT EXISTS walmart;
USE walmart;

-- Verify the current database
SELECT DATABASE();

-- Display all tables in the database
SHOW TABLES;

-- Preview the first 10 rows
SELECT *
FROM walmart_sales
LIMIT 10;

-- Number of rows in the dataset
SELECT COUNT(*) AS total_rows FROM walmart_sales;

-- Display the table structure
DESC walmart_sales;

-- CHECKING FOR NULL VALUES
SELECT * FROM walmart_sales where weekly_sales IS NULL;

-- STORES
SELECT COUNT(DISTINCT Store) as no_of_stores FROM walmart_sales;

-- TOP 20  HIGHEST SALES
SELECT * FROM walmart_sales ORDER BY weekly_sales DESC LIMIT 20;

-- HIGHEST SALES
SELECT MAX(Weekly_Sales) AS highest_weekly_sales
FROM walmart_sales;

-- LOWEST SALES 
SELECT MIN(Weekly_Sales) AS lowest_weekly_sales
FROM walmart_sales;

-- SALES DURING HIGHEST TEMPERATURES
SELECT
    Store,
    Date,
    Weekly_Sales,
    Temperature
FROM walmart_sales
ORDER BY Temperature DESC
LIMIT 10;

-- SALES DURING LOWEST TEMPERATURE
SELECT
    Store,
    Date,
    Weekly_Sales,
    Temperature
FROM walmart_sales
ORDER BY Temperature
LIMIT 10;

-- AVG WEEKLY SALES
SELECT AVG(weekly_sales) as Average_Sales 
FROM walmart_sales;

-- TOTAL SALES 
SELECT SUM(weekly_sales) AS total_sales 
FROM walmart_sales;

-- SALES DURING HOLIDAYS
SELECT Store,Date,weekly_sales FROM walmart_sales 
WHERE Holiday_Flag =1;

-- SALES DURING NON HOLIDAYS
SELECT Store,Date,weekly_sales FROM walmart_sales 
WHERE Holiday_Flag =0;

-- Number of Holidays
SELECT COUNT(Holiday_Flag) AS
no_of_holidays
FROM walmart_sales
 WHERE Holiday_Flag=1;
 
-- Maximum Fuel Price
SELECT MAX(Fuel_Price) AS maximum_fuel 
FROM walmart_sales;

-- Average sales of every store
SELECT 
 Store, AVG(weekly_sales) AS average_sales
FROM walmart_sales
GROUP BY Store;

-- Total Sales By Store
SELECT 
Store,SUM(weekly_sales) as total_sales
FROM walmart_Sales
GROUP BY Store
ORDER BY total_sales DESC;

-- AVERAGE UNEMPLOYTMENT BY STORE
SELECT 
Store, AVG(Unemployment) as average_unemployment
FROM walmart_sales
GROUP BY Store
ORDER BY average_unemployment DESC;

-- Sales above 50000000
SELECT 
Store,
SUM(weekly_sales) AS total_sales
FROM walmart_sales
GROUP BY Store
HAVING total_sales>50000000;

-- Classification of Sales
SELECT
    Weekly_Sales,
    CASE
        WHEN Weekly_Sales >= 2000000 THEN 'High Sales'
        WHEN Weekly_Sales >= 1000000 THEN 'Medium Sales'
        ELSE 'Low Sales'
    END AS Sales_Category
FROM walmart_sales;


-- Dates
SELECT Date FROM walmart_sales LIMIT 10;

-- Conversion of String to Date
SELECT Date, str_to_date(Date,'%d-%m-%Y') AS corrected_date
FROM walmart_sales LIMIT 10;

-- Updation of Table (Run only once after importing the CSV)
UPDATE walmart_sales
SET Date = STR_TO_DATE(Date, '%d-%m-%Y');

DESC walmart_sales;
 
-- Altering Data
ALTER TABLE walmart_sales
MODIFY COLUMN Date DATE;

-- Business Questions 
-- Store Performance
-- Which store generated the highest total sales?
-- 1.Store with Highest Total Sales
SELECT Store, SUM(Weekly_Sales) AS total_sales
FROM walmart_sales
GROUP BY Store
ORDER BY total_sales DESC
LIMIT 1;

-- 2.Which store generated the lowest total sales?
SELECT Store,SUM(weekly_sales) AS total_sales
FROM walmart_sales
GROUP BY Store
ORDER BY total_sales DESC
LIMIT 1;

-- 3.List the top 5 stores by total sales.
SELECT Store,SUM(weekly_sales) AS total_sales
FROM walmart_sales
GROUP BY Store
ORDER BY total_sales DESC
LIMIT 5;

-- 4.List the bottom 5 stores by total sales.
SELECT Store,SUM(weekly_sales) AS total_sales
FROM walmart_sales
GROUP BY Store
ORDER BY total_sales 
LIMIT 5;

-- 5.What is the average weekly sales for every store?alter
SELECT Store,AVG(weekly_sales) AS average_sales
FROM walmart_sales
GROUP BY Store
LIMIT 5;

-- Holiday Analysis
-- 6.Total sales during holidays.
SELECT SUM(weekly_sales) as total_sales_in_holiday
FROM walmart_sales
WHERE Holiday_Flag=1;

-- 7.Total sales during non-holidays.
SELECT SUM(weekly_sales) as total_sales_not_in_holiday
FROM walmart_sales
WHERE Holiday_Flag<>1;

-- 8.Average holiday sales.
SELECT AVG(weekly_sales) as avg_sales
FROM walmart_sales
WHERE Holiday_Flag=1;

-- 9.Average non-holiday ales.
SELECT AVG(weekly_sales) as avg_sales
FROM walmart_sales
WHERE Holiday_Flag<>1;

-- 10.Average Weekly Sales per Store (Holiday Weeks Only)
SELECT Store, AVG(Weekly_Sales) AS avg_sales
FROM walmart_sales
WHERE Holiday_Flag = 1
GROUP BY Store
ORDER BY avg_sales DESC
LIMIT 1;

-- Temperature Analysis
-- 11.Average temperature of every store.
SELECT Store,AVG(Temperature) AS avg_temp
FROM walmart_sales
GROUP BY Store
LIMIT 10;

-- 12.Highest temperature recorded. 
SELECT MAX(Temperature) AS max_temp
FROM walmart_sales;

-- 13. Lowest temperature recorded.
SELECT MIN(Temperature) AS min_temp
FROM walmart_sales;

-- 14. Weekly sales during the highest temperature.
SELECT Store,weekly_sales,Temperature
FROM walmart_sales 
WHERE Temperature=(SELECT(MAX(Temperature)) FROM walmart_sales);

-- 15. Weekly sales during the lowest temperature.
SELECT Store,weekly_sales,Temperature
FROM walmart_sales 
WHERE Temperature=(SELECT(MIN(Temperature)) FROM walmart_sales);

-- Date Analysis
-- 16.Earliest Date.
SELECT MIN(Date) AS earliest_date
FROM walmart_sales;

-- 17.Latest date
SELECT MAX(Date) AS latest_date
FROM walmart_sales;

-- 18.Total sales by year.
SELECT YEAR(Date) AS year, 
SUM(Weekly_Sales) AS total_sales_per_year
FROM walmart_sales
GROUP BY YEAR(Date)
ORDER BY year;

-- 19. Total sales by month.
SELECT MONTH(Date) AS month,
SUM(Weekly_sales) AS total_sales
FROM walmart_sales
GROUP BY MONTH(Date)
ORDER BY month;

-- 20.Highest selling month.
SELECT MONTH(Date) AS month,
SUM(weekly_sales) AS total_sales
FROM walmart_sales
GROUP BY MONTH(Date)
ORDER BY total_sales
LIMIT 1;

-- FUEL 
-- 21.Average fuel price by store.
SELECT AVG(Fuel_Price) AS avg_fuel
FROM walmart_sales
LIMIT 10;

-- 22.Highest fuel price.
SELECT MAX(Fuel_Price) AS max_fuel
FROM walmart_sales;


-- 23.Lowest fuel price.
SELECT MIN(Fuel_Price) AS min_fuel
FROM walmart_sales;

-- 24.Average CPI by store.
SELECT Store,AVG(CPI) AS avg_cpi
FROM walmart_sales
GROUP BY Store
LIMIT 10;

-- 25.Average unemployment by store.
SELECT
Store,
AVG(Unemployment) AS avg_unemp
FROM walmart_sales
GROUP BY Store
ORDER BY avg_unemp DESC;


-- 26.Which stores have total sales above the overall average store sales?
SELECT Store, SUM(Weekly_Sales) AS total_sales
FROM walmart_sales
GROUP BY Store
HAVING SUM(Weekly_Sales) > (
    SELECT AVG(store_total)
    FROM (
        SELECT SUM(Weekly_Sales) AS store_total
        FROM walmart_sales
        GROUP BY Store
    ) AS subquery
);


-- 28.Categorize each store into High, Medium, and Low performers based on total sales.
SELECT Store,SUM(Weekly_sales) AS total_sales,
CASE
WHEN SUM(Weekly_sales)> 160000000 THEN 'HIGH SALES'
WHEN SUM(Weekly_sales) <120000000 THEN 'MID SALES'
ELSE 'LOW SALES'
END AS sales_category
FROM walmart_sales
GROUP BY Store
ORDER BY total_sales DESC;
