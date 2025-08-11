CREATE DATABASE walmart_db;
USE walmart_db;

CREATE TABLE walmart_data (
    User_ID INT,
    Product_ID VARCHAR(50),
    Gender CHAR(1),
    Age VARCHAR(20),
    Occupation INT,
    City_Category CHAR(1),
    Stay_In_Current_City_Years VARCHAR(10),
    Marital_Status INT,
    Purchase INT
);

SHOW VARIABLES LIKE 'secure_file_priv';

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/walmart (1).csv"
INTO TABLE walmart_data
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SET GLOBAL local_infile = 1;

DROP TABLE IF EXISTS walmart_data;

CREATE TABLE walmart_data (
    User_ID INT,
    Product_ID VARCHAR(50),
    Gender VARCHAR(10),
    Age VARCHAR(10),
    Occupation INT,
    City_Category VARCHAR(10),
    Stay_In_Current_City_Years VARCHAR(10),
    Marital_Status INT,
    Product_Category_1 INT,
    Purchase INT
);

#Total Revenue by Age Group

SELECT Age, SUM(Purchase) AS Total_Revenue
FROM walmart_data
GROUP BY Age
ORDER BY Total_Revenue DESC;

#Top 10 Customers by Spending

SELECT User_ID, SUM(Purchase) AS Total_Spent
FROM walmart_data
GROUP BY User_ID
ORDER BY Total_Spent DESC
LIMIT 10;

#Top 10 Revenue-Generating Products

SELECT Product_ID, SUM(Purchase) AS Revenue
FROM walmart_data
GROUP BY Product_ID
ORDER BY Revenue DESC
LIMIT 10;

#Revenue by City Category

SELECT City_Category, SUM(Purchase) AS Total_Revenue
FROM walmart_data
GROUP BY City_Category
ORDER BY Total_Revenue DESC;

#Occupations with Highest Purchase Value

SELECT Occupation, SUM(Purchase) AS Revenue
FROM walmart_data
GROUP BY Occupation
ORDER BY Revenue DESC
LIMIT 10;

#Average Purchase by Marital Status

SELECT Marital_Status, AVG(Purchase) AS Avg_Purchase
FROM walmart_data
GROUP BY Marital_Status;

#Which gender spends more on average?

SELECT Gender, AVG(Purchase) AS Avg_Purchase
FROM walmart_data
GROUP BY Gender;

#Which age group has the highest number of purchases?

SELECT Age, COUNT(*) AS Total_Orders
FROM walmart_data
GROUP BY Age
ORDER BY Total_Orders DESC;

#How many married vs. unmarried customers are there?

SELECT 
  CASE 
    WHEN Marital_Status = 1 THEN 'Married'
    ELSE 'Unmarried'
  END AS Marital_Status,
  COUNT(*) AS Total_Customers
FROM walmart_data
GROUP BY Marital_Status;

#Top 10 Product IDs with the most number of purchases (by count)?

SELECT Product_ID, COUNT(*) AS Purchase_Count
FROM walmart_data
GROUP BY Product_ID
ORDER BY Purchase_Count DESC
LIMIT 10;

#How many unique users bought each product?

SELECT Product_ID, COUNT(DISTINCT User_ID) AS Unique_Buyers
FROM walmart_data
GROUP BY Product_ID
ORDER BY Unique_Buyers DESC
LIMIT 10;

