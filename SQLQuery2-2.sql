--14
SELECT DISTINCT p.ProductName
FROM Orders o
JOIN [Order Details] od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE o.OrderDate >= DATEADD(year, -25, GETDATE());

--15
SELECT TOP 5 o.ShipPostalCode, COUNT(*) AS TotalSales
FROM Orders o
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY o.ShipPostalCode
ORDER BY TotalSales DESC;

--16
SELECT TOP 5 o.ShipPostalCode, COUNT(*) AS TotalSales
FROM Orders o
JOIN [Order Details] od ON o.OrderID = od.OrderID
WHERE o.OrderDate >= DATEADD(year, -25, GETDATE())
GROUP BY o.ShipPostalCode
ORDER BY TotalSales DESC;

--17
SELECT c.City, COUNT(*) AS NumberOfCustomers
FROM Customers c
GROUP BY c.City;

--18
SELECT c.City, COUNT(*) AS NumberOfCustomers
FROM Customers c
GROUP BY c.City
HAVING COUNT(*) > 2;

--19
SELECT DISTINCT cu.CompanyName, o.OrderDate
FROM Customers cu
JOIN Orders o ON cu.CustomerID = o.CustomerID
WHERE o.OrderDate > '1998-01-01'
ORDER BY o.OrderDate;


--20
SELECT cu.CompanyName, MAX(o.OrderDate) AS MostRecentOrderDate
FROM Customers cu
JOIN Orders o ON cu.CustomerID = o.CustomerID
GROUP BY cu.CompanyName
ORDER BY MostRecentOrderDate DESC;

--21
SELECT cu.CompanyName, COUNT(od.ProductID) AS ProductCount
FROM Customers cu
JOIN Orders o ON cu.CustomerID = o.CustomerID
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY cu.CompanyName;

--22
SELECT cu.CustomerID, COUNT(od.ProductID) AS ProductCount
FROM Customers cu
JOIN Orders o ON cu.CustomerID = o.CustomerID
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY cu.CustomerID
HAVING COUNT(od.ProductID) > 100;

--23

--24
SELECT o.OrderDate, p.ProductName
FROM Orders o
JOIN [Order Details] od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
ORDER BY o.OrderDate;

--25
SELECT e1.FirstName + ' ' + e1.LastName AS EmployeeName1, e2.FirstName + ' ' + e2.LastName AS EmployeeName2, e1.Title
FROM Employees e1, Employees e2
WHERE e1.EmployeeID < e2.EmployeeID AND e1.Title = e2.Title;

--26

--27
SELECT City, CompanyName, ContactName, 'Customer' AS Type
FROM Customers
UNION ALL
SELECT City, CompanyName, ContactName, 'Supplier'
FROM Suppliers;