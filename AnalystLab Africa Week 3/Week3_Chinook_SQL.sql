/*
Week 3 SQL Internship
Chinook Book Analysis
*/

/* Section 1: Core SQL Queries */
SELECT *
FROM Customer

SELECT FirstName,
       LastName,
       Country,
       City,
       PostalCode,
       SupportRepId,
       Email
FROM Customer
WHERE Country = 'Brazil'

SELECT CustomerId,
       FirstName,
       LastName,
       Country
FROM Customer
WHERE Country <> 'USA'

/* Section 2: Aggregate Functions */
SELECT FirstName,
       LastName
FROM Customer
ORDER BY LastName ASC

SELECT InvoiceId,
       CustomerId,
       Total
FROM Invoice
ORDER BY Total DESC

SELECT SUM(Total) AS TotalRevenue
FROM Invoice

SELECT AVG(Total) AS AverageInvoice
FROM Invoice

SELECT MAX(Total) AS HighestInvoice
FROM Invoice

SELECT COUNT(*) AS TotalInvoices
FROM Invoice

SELECT Country,
       COUNT(*) AS NumberOfCustomers
FROM Customer
GROUP BY Country
ORDER BY NumberOfCustomers DESC

SELECT BillingCountry,
       SUM(Total) AS Revenue
FROM Invoice
GROUP BY BillingCountry
ORDER BY Revenue DESC

SELECT BillingCountry,
       AVG(Total) AS AverageInvoice
FROM Invoice
GROUP BY BillingCountry
ORDER BY AverageInvoice DESC

SELECT Country,
       COUNT(*) AS NumberOfCustomers
FROM Customer
GROUP BY Country
HAVING COUNT(*) > 1

SELECT BillingCountry,
       SUM(Total) AS Revenue
FROM Invoice
GROUP BY BillingCountry
HAVING SUM(Total) > 100
ORDER BY Revenue DESC

/* Section 3: Joins */
SELECT
    c.CustomerId,
    c.FirstName,
    c.LastName,
    i.InvoiceId,
    i.Total
FROM Customer c
INNER JOIN Invoice i
ON c.CustomerId = i.CustomerId

SELECT
    c.CustomerId,
    c.FirstName,
    c.LastName,
    i.InvoiceId
FROM Customer c
LEFT JOIN Invoice i
ON c.CustomerId = i.CustomerId

SELECT
    c.CustomerId,
    c.FirstName,
    i.InvoiceId
FROM Customer c
RIGHT JOIN Invoice i
ON c.CustomerId = i.CustomerId



SELECT
    c.CustomerId,
    c.FirstName,
    c.LastName,
    c.Country,

    e.FirstName + ' ' + e.LastName AS SupportRep,

    i.InvoiceId,
    i.InvoiceDate,
    i.Total,

    il.InvoiceLineId,
    il.Quantity,
    il.UnitPrice,

    t.TrackId,
    t.Name AS TrackName,
    t.Milliseconds,

    a.Title AS Album,

    ar.Name AS Artist,

    g.Name AS Genre,

    m.Name AS MediaType

FROM Customer c

INNER JOIN Employee e
    ON c.SupportRepId = e.EmployeeId

INNER JOIN Invoice i
    ON c.CustomerId = i.CustomerId

INNER JOIN InvoiceLine il
    ON i.InvoiceId = il.InvoiceId

INNER JOIN Track t
    ON il.TrackId = t.TrackId

INNER JOIN Album a
    ON t.AlbumId = a.AlbumId

INNER JOIN Artist ar
    ON a.ArtistId = ar.ArtistId

INNER JOIN Genre g
    ON t.GenreId = g.GenreId

INNER JOIN MediaType m
    ON t.MediaTypeId = m.MediaTypeId
    
/* Section 4: Business Analysis */
SELECT top 10
    c.CustomerId,
    c.FirstName,
    c.LastName,
    SUM(i.Total) AS TotalSpent
FROM Customer c
INNER JOIN Invoice i
ON c.CustomerId = i.CustomerId
GROUP BY
    c.CustomerId,
    c.FirstName,
    c.LastName
ORDER BY TotalSpent DESC

SELECT TOP 10
    ar.Name AS Artist,
    COUNT(il.InvoiceLineId) AS TracksSold
FROM InvoiceLine il
JOIN Track t
    ON il.TrackId = t.TrackId
JOIN Album a
    ON t.AlbumId = a.AlbumId
JOIN Artist ar
    ON a.ArtistId = ar.ArtistId
GROUP BY ar.Name
ORDER BY TracksSold DESC

SELECT
    BillingCountry,
    SUM(Total) AS Revenue
FROM Invoice
GROUP BY BillingCountry
ORDER BY Revenue DESC

SELECT TOP 10
    g.Name AS Genre,
    COUNT(*) AS Sales
FROM InvoiceLine il
JOIN Track t
    ON il.TrackId = t.TrackId
JOIN Genre g
    ON t.GenreId = g.GenreId
GROUP BY g.Name
ORDER BY Sales DESC

SELECT top 10
    YEAR(InvoiceDate) AS SalesYear,
    SUM(Total) AS Revenue
FROM Invoice
GROUP BY
    YEAR(InvoiceDate)
ORDER BY
    SalesYear DESC

/* Section 5: Subqueries */
SELECT CustomerId,
       FirstName,
       LastName
FROM Customer
WHERE CustomerId IN
(SELECT CustomerId
    FROM Invoice
    GROUP BY CustomerId
    HAVING SUM(Total) >
    (SELECT AVG(CustomerTotal)
        FROM
        (SELECT SUM(Total) AS CustomerTotal
            FROM Invoice
            GROUP BY CustomerId) AS AvgTable))

/* Section 6: Window Functions */
SELECT
    CustomerId,
    InvoiceId,
    Total,
    ROW_NUMBER() OVER
    (PARTITION BY CustomerId
        ORDER BY Total DESC) AS RowNum
FROM Invoice

SELECT
    CustomerId,
    InvoiceId,
    Total,
    DENSE_RANK() OVER
    (ORDER BY Total DESC) AS DenseRank
FROM Invoice