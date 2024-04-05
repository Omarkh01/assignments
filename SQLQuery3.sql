--1
SELECT DISTINCT e.City
FROM Employees e JOIN Customers c on e.City = c.City

--2.a
SELECT DISTINCT City
FROM Customers
WHERE City NOT IN (SELECT City FROM Employees)

--2.b
SELECT DISTINCT c.City
FROM Customers c 
LEFT JOIN Employees e on c.City = e.City
WHERE e.City IS NULL

--3
SELECT p.ProductName, SUM(od.Quantity) AS TotalQuantity
FROM Products p
JOIN [Order Details] od on p.ProductID = od.ProductID
GROUP BY p.ProductName

--4
SELECT c.City, SUM(od.Quantity) AS TotalProductsOrdered
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN [Order Details] od on o.OrderID = od.OrderID
GROUP BY c.City

--5.a
SELECT City
FROM (SELECT City FROM Customers
	  UNION ALL
	  SELECT City FROM Customers) AS Combined
GROUP BY City
HAVING COUNT(*) >= 2

--5.b
SELECT City
FROM Customers
GROUP BY City
HAVING COUNT(CustomerID) >= 2

--6
SELECT c.City
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY c.City
HAVING COUNT(DISTINCT od.ProductID) >= 2;

--7
SELECT DISTINCT c.ContactName
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE c.City <> o.ShipCity

--8
