USE bestbuy;

-- what was the most sold product?
SELECT * FROM sales;
-- only returns product/employee ID's
SELECT * FROM products;
-- returns products with their ID's
SELECT * FROM employees;
-- returns employees with their ID's

-- Inner Join
SELECT * FROM sales INNER JOIN employees ON sales.EmployeeID = employees.EmployeeID WHERE ProductID = 4;
-- returns a combined table from employees and sales based on matching employee ID's
SELECT sales.SalesID, sales.Quantity, sales.PricePerUnit, CONCAT(employees.FirstName, " ", employees.LastName) AS Employee
FROM sales INNER JOIN employees ON sales.EmployeeID = employees.EmployeeID WHERE ProductID = 4;
-- returns a table with information from sales and employees combined into a small table with 4 columns of information

-- Combine 3 tables of information to 1 clean table
SELECT sales.SalesID, sales.Quantity, sales.PricePerUnit, products.Name,  CONCAT(employees.FirstName, " ", employees.LastName) AS Employee
FROM sales INNER JOIN employees ON sales.EmployeeID = employees.EmployeeID INNER JOIN products ON products.ProductID = sales.ProductID WHERE sales.ProductID = 4;

-- Combine 4 tables of information to 1 clean table sorted by first name of sales person
SELECT CONCAT(employees.FirstName, " ", employees.LastName) AS Employee, sales.SalesID, sales.Quantity, sales.PricePerUnit, products.Name, reviews.Rating, reviews.Comment 
FROM sales INNER JOIN employees ON sales.EmployeeID = employees.EmployeeID
INNER JOIN products ON products.ProductID = sales.ProductID
INNER JOIN reviews ON sales.ProductID = reviews.ProductID
WHERE sales.ProductID = 4
ORDER BY FirstName;


-- Left Join
SELECT * FROM employees LEFT JOIN sales ON sales.EmployeeID = employees.EmployeeID;
-- Returns employees that did not make a sale, along with the employees that did make a sale (all employees have ID's)
SELECT * FROM sales LEFT JOIN employees ON sales.EmployeeID = employees.EmployeeID;
-- swapping which table is accesed first returns same results as Inner Join (only sales ID's)