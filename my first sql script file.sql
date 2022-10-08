-- This is a line comment
/* This is
a block level
comment */

-- Here is a select statement
-- Must specify which database to access
USE bestbuy;
SELECT * FROM employees; -- WHERE FirstName = "Harrison";

-- Insert a record into a table
INSERT INTO employees (FirstName, LastName, EmailAddress, Title) Values ('Harrison', 'Fangmeier', 'Harry@notreallybestbuy.com', 'Student of Electronics');
-- Insert option 2
INSERT INTO employees SET FirstName = "Hunter", LastName = "Andersen", EmailAddress = "hunter@notreallybestbuy.com", Title = "Assistant to the Master of Electronics";

-- Update a Record
UPDATE employees SET Title = "Master of Electronics" WHERE EmployeeID = 34618;

-- Delete a Record
DELETE FROM employees WHERE EmployeeID = 32769;
-- If you do not include 'WHERE Clause' you risk deleting entire database

-- AND, OR, NOT
SELECT * FROM Customers WHERE Country = 'USA' AND City = 'Birmingham';
SELECT * FROM Customers WHERE Country = 'USA' OR Country = 'Poland';
SELECT * FROM Customers WHERE NOT Country = 'USA';
SELECT * FROM Customers WHERE Country = 'USA' AND NOT Country = 'Germany';


-- SORTING
SELECT * FROM products WHERE price < 20 ORDER BY Price DESC, Name ASC;

-- NULL represents the absence of value
SELECT * FROM employees WHERE MiddleInitial IS NULL;
-- Returns all employees with MiddleInitial NULL

-- Select distinct
SELECT DISTINCT FirstName FROM employees ORDER BY FirstName;
-- Adding columns to ^ search will provide more results (like &&)

-- LIKE is used to search with "loose equality"
SELECT DISTINCT FirstName FROM employees WHERE FirstName LIKE "a%" ORDER BY FirstName;
-- This will pull results that start with a/A 
SELECT DISTINCT FirstName FROM employees WHERE FirstName LIKE "a__a%" ORDER BY FirstName;
-- This will pull names that are spelled at least 4 characters starting with 'a/A' and the 4th char is 'a/A'
SELECT DISTINCT FirstName FROM employees WHERE FirstName LIKE "a__a%" OR FirstName = 'Ben' ORDER BY FirstName ;
-- This will pull names that are spelled at least 4 characters starting with 'a/A' and the 4th char is 'a/A' and names that are 'Ben'

-- Aggregate Functions
SELECT COUNT(*) FROM products;
-- Will return total number of products
SELECT AVG(Price) FROM products WHERE Price < 20;
-- Will return avg price of all products under $20.00
SELECT SUM(Quantity) FROM sales;
-- Will return the sum of all quantities from items in sales
SELECT SUM(Quantity) AS Total_Sales FROM sales;
-- Will return the sum of all quantities from items in sales as an allias 'Total_Sales = SUM'
-- Every Column is an Object, the Rows are Keys, the Cells are the Values

SELECT PhoneNumber FROM employees;
SELECT OnSale FROM products;

-- Round returned Ints
SELECT ROUND(AVG(PricePerUnit), 2) AS AvgPrice FROM sales;
-- Rounds returned number to 2 decimal places

SELECT * FROM sales;

-- Add columns together as a new value
SELECT CONCAT(Firstname, " ", LastName) AS FullName, EmailAddress FROM employees;
-- This will return First and Last name concatinated at Full name

-- Search for values between
SELECT * FROM products WHERE StockLevel BETWEEN 500 AND 1200 ORDER BY Price DESC;
-- This will return all products based on StockLevel and sorted by Price from highest to lowest