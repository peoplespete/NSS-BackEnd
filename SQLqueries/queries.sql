-- Find the names of all “sales representatives” who work in London.

SELECT EmployeeID, FirstName, LastName FROM Employees
  WHERE Title = "Sales Representative" AND City = "London"
  ORDER BY FirstName, LastName

-- Find the name of the female "sales representative" who work in London and report to the Sales Manager Mr. Steven Buchanan. (Please do not enter any criterion under the "ReportsTo" field when answering this query.)
-- THIS ONE IS A TABLE JOINED TO ITSELF BY THE EMPLOYEEID AND REPORTSTO COLUMN
SELECT Employees.EmployeeID, Employees.FirstName, Employees.LastName
  From Employees INNER JOIN Employees Managers
  ON Employees.ReportsTo = Managers.EmployeeID
  WHERE Employees.Title = "Sales Representative" AND
        Employees.City = "London" AND
        Employees.TitleOfCourtesy IN ("Mrs.", "Ms.") AND
        Managers.LastName = "Buchanan" AND
        Managers.FirstName = "Steven"
  ORDER BY Employees.FirstName, Employees.LastName

-- Find the names and addresses of all the suppliers which can provide “tofu”. (Note: You should be able to find two companies.)

SELECT Products.ProductName, Suppliers.CompanyName
  From Products INNER JOIN Suppliers
  ON Products.SupplierID = Suppliers.SupplierID
  WHERE Products.ProductName LIKE '%Tofu%'
  ORDER BY Products.ProductName, Suppliers.CompanyName

-- List the sales for orders shipped to France.

SELECT OrderID, CustomerID, ShipCountry
  From Orders
  Where ShipCountry = "France"
  ORDER BY OrderID

-- Find the products on order from companies based in the UK.

SELECT Products.ProductID, Products.ProductName, Suppliers.CompanyName
  FROM Products INNER JOIN Suppliers
  ON Products.SupplierID = Suppliers.SupplierID
  WHERE Suppliers.Country = 'UK'
  ORDER BY Products.ProductName

-- List all the orders taken by the sales representative Anne Dodsworth from the companies based in London along with the unit price and quantity of each order.

-- THIS ONE COULD BE TAKEN DIFFERENT WAYS.  IF YOU TOOK IT AS THE COMPANIES ORDERING (CUSTOMERS) ARE THE ONES BASED IN LONDON
-- THE CODE BELOW WOULD NEED TO BE CHANGED.  I TOOK IT TO MEAN THAT THE ORDERS WERE BEING FULFILLED BY SUPPLIERS BASED IN LONDON
-- IF YOU PUT DISTINCT RIGHT AFTER SELECT IT WILL ONLY LIST DISTINCT ONES
-- IF YOU PUT GROUP BY AT THE END...IT DOES SOMETHING

SELECT Products.ProductName, Orders.OrderID, OrderDetails.UnitPrice, OrderDetails.Quantity, Employees.FirstName, Employees.LastName, Suppliers.City
  FROM Employees
  INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
  INNER JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
  INNER JOIN Products ON OrderDetails.ProductID = Products.ProductID
  INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
  WHERE Employees.LastName = "Dodsworth" AND
        Employees.FirstName = "Anne" AND
        Suppliers.City = "London"
  ORDER BY Orders.OrderID ASC

