CREATE DATABASE SupermarketDB;
USE SupermarketDB;

CREATE TABLE SalesData (
    Invoice_ID VARCHAR(50) PRIMARY KEY,
    Branch CHAR(1),
    City VARCHAR(50),
    Customer_type VARCHAR(20),
    Gender VARCHAR(10),
    Product_line VARCHAR(100),
    Unit_price DECIMAL(10, 2),
    Quantity INT,
    Tax_5_percent DECIMAL(10, 4),
    Total_Sales DECIMAL(10, 4),
    Date_Str VARCHAR(20), -- We import as text first, then convert
    Time_Str VARCHAR(20),
    Payment VARCHAR(20),
    COGS DECIMAL(10, 2),
    Gross_margin_percentage DECIMAL(10, 7),
    Gross_income DECIMAL(10, 4),
    Rating DECIMAL(3, 1)
    
);
select count(*) from Salesdata;

-- Total Reveneu generated from Branch

select Branch, round(SUM(Total_sales),2) As Total_Revenue
from SalesData group by Branch
order by Total_Revenue DESC;

-- Average Rating by Product Line

select Product_line, round(AVG(Rating),2)As Avg_Rating
from SalesData group by Product_line
order by Avg_Rating DESC;

-- Check Paymet Refrences

select Payment, count(*) As Transaction_count
from SalesData group by Payment
order by Transaction_count Desc;

-- Top Rated Product Lines

select Product_line, Round(AVG(Rating),2) AS Average_Rating
from SalesData
group by Product_line
order by Average_Rating Desc;

-- Highest Volume Branch

select Branch, count(*) As Total_transactions
from SalesData
group by Branch
order by Total_transactions DESC;


