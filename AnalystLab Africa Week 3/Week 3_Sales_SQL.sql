SELECT TOP 10 *
FROM sales_data_sample

/* Basic Queries */
-- Display the first 10 records
SELECT TOP 10 *
FROM sales_data_sample

-- Count total records
SELECT COUNT(*) AS TotalRecords
FROM sales_data_sample

-- Calculate total sales revenue
SELECT SUM(SALES) AS TotalRevenue
FROM sales_data_sample

-- Calculate average sales
SELECT AVG(SALES) AS AverageSales
FROM sales_data_sample

-- Highest sales amount
SELECT MAX(SALES) AS HighestSale
FROM sales_data_sample

-- Lowest sales amount
SELECT MIN(SALES) AS LowestSale
FROM sales_data_sample

/* Section 2: Group By and Having */
-- Total sales by product line
SELECT
    PRODUCTLINE,
    SUM(SALES) AS TotalSales
FROM sales_data_sample
GROUP BY PRODUCTLINE
ORDER BY TotalSales DESC

-- Top 10 products by revenue
SELECT TOP 10
    PRODUCTCODE,
    SUM(SALES) AS TotalSales
FROM sales_data_sample
GROUP BY PRODUCTCODE
ORDER BY TotalSales DESC

-- Product lines with revenue greater than 500000
SELECT
    PRODUCTLINE,
    SUM(SALES) AS TotalSales
FROM sales_data_sample
GROUP BY PRODUCTLINE
HAVING SUM(SALES) > 500000
ORDER BY TotalSales DESC

/* Section 3: Business Questions */
-- Monthly sales trend
SELECT
    YEAR(ORDERDATE) AS SalesYear,
    MONTH(ORDERDATE) AS SalesMonth,
    SUM(SALES) AS TotalSales
FROM sales_data_sample
GROUP BY
    YEAR(ORDERDATE),
    MONTH(ORDERDATE)
ORDER BY
    SalesYear,
    SalesMonth
-- Top 10 highest value orders
SELECT TOP 10
    ORDERNUMBER,
    CUSTOMERNAME,
    SALES
FROM sales_data_sample
ORDER BY SALES DESC

-- Best-selling product lines
SELECT
    PRODUCTLINE,
    COUNT(*) AS Orders,
    SUM(SALES) AS Revenue
FROM sales_data_sample
GROUP BY PRODUCTLINE
ORDER BY Revenue DESC

/* Section 4: Subqueries */
-- Customers with above-average total sales
SELECT
    CUSTOMERNAME,
    SUM(SALES) AS TotalSales
FROM sales_data_sample
GROUP BY CUSTOMERNAME
HAVING SUM(SALES) >
(SELECT AVG(CustomerSales)
    FROM
    (SELECT SUM(SALES) AS CustomerSales
        FROM sales_data_sample
        GROUP BY CUSTOMERNAME) AS AvgSales)
ORDER BY TotalSales DESC

-- Products with above-average sales
SELECT
    PRODUCTCODE,
    SALES
FROM sales_data_sample
WHERE SALES >
(SELECT AVG(SALES)
    FROM sales_data_sample)
ORDER BY SALES DESC

/* Section 5: Window Functions */
-- Dense rank all orders by sales
SELECT
    CUSTOMERNAME,
    ORDERNUMBER,
    SALES,
    DENSE_RANK() OVER
    (ORDER BY SALES DESC) AS DenseRank
FROM sales_data_sample

-- Number each customer's orders
SELECT
    CUSTOMERNAME,
    ORDERNUMBER,
    SALES,
    ROW_NUMBER() OVER
    (PARTITION BY CUSTOMERNAME
        ORDER BY SALES DESC) AS RowNum
FROM sales_data_sample