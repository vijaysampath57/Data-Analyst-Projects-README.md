Create database amazon;
use amazon;

## CustomerID	Name	Age	Gender	City	State	Country	SignupDate	PrimeMember
create table amazon.customers
(CustomerID varchar(200),
Name varchar(200),
Age int,
Gender varchar(10),
City varchar(200),
State Varchar(200),
Country varchar(200),
SignupDate date,
PrimeMember Varchar(10));

## OrderID	ProductID	Quantity	UnitPrice	Discount
create table order_details
(OrderID varchar(200),
ProductID varchar(200),
Quantity int,
UnitPrice int,
Discount int);

## OrderID	CustomerID	OrderDate	OrderAmount	DeliveryFee	DiscountApplied
create table orders
(OrderID varchar(200),
CustomerID varchar(200),
OrderDate date,
OrderAmount int,
DeliveryFee int,
DiscountApplied int);

## ProductID	ProductName	Category	SubCategory	PricePerUnit	StockQuantity	SupplierID
Create table products
(ProductID varchar(200),
ProductName Varchar(200),
Category varchar(200),
SubCategory	varchar(200),
PricePerUnit int,
StockQuantity int,	
SupplierID Varchar(500));

## ReviewID	ProductID	CustomerID	Rating	ReviewText
create table reviews
(ReviewID varchar(500),	
ProductID varchar(500),	
CustomerID varchar(500),	
Rating int,	
ReviewText varchar(200));

## SupplierID	SupplierName	ContactPerson	Phone	City	State
create table suppliers
(SupplierID varchar(500),	
SupplierName varchar(200),
ContactPerson varchar(100),	
Phone varchar(25),
City varchar(100),	
State varchar(100));

## Retrieve all customers from a specific city. 
SELECT *
FROM customers
WHERE City = 'Chennai';

## Fetch all products under the Fruits category
SELECT *
FROM products
WHERE Category = 'Fruits';

## Recreate the Customers table with constraints
CREATE TABLE Customers_New
(CustomerID VARCHAR(200) PRIMARY KEY,
Name VARCHAR(200) UNIQUE,
Age INT NOT NULL CHECK (Age > 18),
Gender VARCHAR(10),
City VARCHAR(200),
State VARCHAR(200),
Country VARCHAR(200),
SignupDate DATE,
PrimeMember VARCHAR(10));

## Insert 3 new rows into the Products table
INSERT INTO products
(ProductID, ProductName, Category, SubCategory,
 PricePerUnit, StockQuantity, SupplierID)
VALUES
('01-ppu', 'Apple', 'Fruits', 'Sub-Fruits', 120, 50, '04-sid'),
('02-ppu', 'Banana', 'Fruits', 'Sub-Fruits', 60, 100, '05-sid'),
('03-ppu', 'Orange', 'Fruits', 'Sub-Fruits', 90, 75, '06-sid');
SELECT * FROM products;

## Update stock quantity for a specific product
UPDATE products
SET StockQuantity = 80
WHERE ProductID = '01-ppu';

## Delete suppliers based on city
DELETE FROM suppliers
WHERE City = 'Chennai';
SELECT * FROM suppliers;

## Ratings must be between 1 and 5, inclusive.
ALTER TABLE reviews
ADD CONSTRAINT chk_rating
CHECK (Rating BETWEEN 1 AND 5);

## Add a DEFAULT constraint to Customers
ALTER TABLE customers
ALTER COLUMN PrimeMember SET DEFAULT 'No';

## Find orders placed after January 1, 2024
SELECT *
FROM orders
WHERE OrderDate > '2024-01-01';

## Find products with an average rating greater than 4
SELECT p.ProductID, p.ProductName,
AVG(r.Rating) AS AverageRating
FROM products p
JOIN reviews r
ON p.ProductID = r.ProductID
GROUP BY p.ProductID, p.ProductName
HAVING AVG(r.Rating) > 4;

## Rank products by total sales
SELECT p.ProductID, p.ProductName,
SUM(od.Quantity * od.UnitPrice) AS TotalSales
FROM products p
JOIN order_details od
ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY TotalSales DESC;

## Calculate each customer's total spending
SELECT c.CustomerID, c.Name,
SUM(o.OrderAmount) AS TotalSpending
FROM customers c
JOIN orders o
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Name
ORDER BY TotalSpending DESC;

## Rank customers by total spending
SELECT CustomerID, Name, TotalSpending,
RANK() OVER (ORDER BY TotalSpending DESC) AS CustomerRank
FROM (SELECT c.CustomerID, c.Name,
SUM(o.OrderAmount) AS TotalSpending
FROM customers c
JOIN orders o
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Name) AS CustomerTotals
ORDER BY CustomerRank;

## Find customers who spent more than ₹5,000
SELECT c.CustomerID, c.Name,
SUM(o.OrderAmount) AS TotalSpending
FROM customers c
JOIN orders o
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Name
HAVING SUM(o.OrderAmount) > 5000
ORDER BY TotalSpending DESC;

## Calculate total revenue per order
SELECT o.OrderID, o.CustomerID, o.OrderDate,
SUM(od.Quantity * od.UnitPrice) AS TotalRevenue
FROM orders o
JOIN order_details od
ON o.OrderID = od.OrderID
GROUP BY o.OrderID, o.CustomerID, o.OrderDate
ORDER BY TotalRevenue DESC;

## Identify customers who placed the most orders in a specific time period 
SELECT c.CustomerID, c.Name, COUNT(o.OrderID) AS TotalOrders
FROM customers c
JOIN orders o
ON c.CustomerID = o.CustomerID
WHERE o.OrderDate >= '2024-01-01'
AND o.OrderDate < '2025-01-01'
GROUP BY c.CustomerID, c.Name
ORDER BY TotalOrders DESC;

## Find the supplier with the most products in stock
SELECT s.SupplierID, s.SupplierName,
SUM(p.StockQuantity) AS TotalStock,
COUNT(p.ProductID) AS NumberOfProducts
FROM suppliers s
JOIN products p
ON s.SupplierID = p.SupplierID
GROUP BY s.SupplierID, s.SupplierName
ORDER BY TotalStock DESC
LIMIT 1;

## Create the Categories table
CREATE TABLE categories 
(CategoryID INT PRIMARY KEY, 
CategoryName VARCHAR(200));

## Create the Subcategories table
CREATE TABLE subcategories 
(SubCategoryID INT PRIMARY KEY,
SubCategoryName VARCHAR(200),
CategoryID INT);
## Alter Product
ALTER TABLE products
ADD COLUMN SubCategoryID INT;

## Update Product
UPDATE products p
JOIN categories c
ON p.Category = c.CategoryName
JOIN subcategories sc
ON sc.CategoryID = c.CategoryID
AND sc.SubCategoryName = p.SubCategory
SET p.SubCategoryID = sc.SubCategoryID;

## Identify the top 3 products by sales revenue
SELECT p.ProductID, p.ProductName,
(SELECT SUM(od.Quantity * od.UnitPrice)
FROM order_details od
WHERE od.ProductID = p.ProductID ) AS TotalRevenue
FROM products p
WHERE p.ProductID IN 
(SELECT ProductID FROM order_details
GROUP BY ProductID)
ORDER BY TotalRevenue DESC LIMIT 3;

## Find customers who have not placed any orders yet
SELECT c.CustomerID, c.Name, c.City
FROM customers c
WHERE NOT EXISTS (SELECT 1 FROM orders o
WHERE o.CustomerID = c.CustomerID);

## Which cities have the highest concentration of Prime members?
SELECT City, COUNT(*) AS TotalCustomers,
SUM(CASE WHEN LOWER(PrimeMember) = 'yes' THEN 1
ELSE 0
END) AS PrimeMembers,
ROUND(100.0 * SUM(CASE WHEN LOWER(PrimeMember) = 'yes' THEN 1
ELSE 0
END) / COUNT(*),2) AS PrimePercentage
FROM customers
WHERE City IS NOT NULL
GROUP BY City
HAVING COUNT(*) >= 1
ORDER BY PrimePercentage DESC, PrimeMembers DESC;

