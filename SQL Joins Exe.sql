/* joins: select all the computers from the products table:

using the products table and the categories table, return the product name and the category name */
SELECT products.Name AS "Product Name", categories.Name AS "Category Name" FROM products INNER JOIN categories ON categories.CategoryID = products.CategoryID WHERE categories.Name = "computers";

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT products.Name, products.Price, reviews.Rating FROM products INNER JOIN reviews ON products.ProductID = reviews.ProductID WHERE reviews.Rating = "5";
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT SUM(Quantity) AS Total, CONCAT(employees.EmployeeID, " - ", employees.FirstName, " ", employees.LastName) AS "Employee Information" FROM sales INNER JOIN employees ON employees.EmployeeID = sales.EmployeeID GROUP BY employees.EmployeeID HAVING Total = (SELECT SUM(Quantity) AS max FROM sales GROUP BY EmployeeID ORDER BY max DESC LIMIT 1) ORDER BY Total DESC;
/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT departments.Name AS Department, categories.Name As Category FROM departments INNER JOIN categories ON categories.DepartmentID = departments.DepartmentID WHERE categories.Name = "Appliances" OR categories.Name = "Games";
/* joins: find the product name, total # sold, and total price sold,

 for Eagles: Hotel California --You may need to use SUM() */
SELECT products.Name AS "Product Name", SUM(sales.Quantity) AS "Total Sold", SUM(sales.Quantity * sales.PricePerUnit) AS "Total Sales Amount" FROM sales INNER JOIN products ON sales.ProductID = products.ProductID WHERE products.Name Like "%Hotel California%";
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT products.Name, reviews.Reviewer, reviews.Rating, reviews.Comment FROM products INNER JOIN reviews ON products.ProductID = reviews.ProductID WHERE products.Name Like "%Visio%" AND reviews.rating = 1 GROUP BY reviews.Rating;
-- ------------------------------------------ Extra - May be difficult

/* Your goal is to write a query that serves as an employee sales report.

This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
SELECT products.ProductID, employees.EmployeeID AS "Employee ID", CONCAT(employees.FirstName, " ", employees.LastName) AS Employee_Name, products.Name AS "Product Name" , SUM(sales.Quantity) AS "Total Product Sold", SUM(sales.Quantity * sales.PricePerUnit) AS Gross_Revenue FROM sales INNER JOIN employees ON sales.EmployeeID = employees.EmployeeID INNER JOIN products ON products.ProductID = sales.ProductID GROUP BY employees.EmployeeID, sales.ProductID ORDER BY Employee_Name, Gross_Revenue DESC;