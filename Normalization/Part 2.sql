SELECT
  c.CustomerID,
  c.FullName,
  c.Email,
  SUM(od.Quantity * od.Price) AS total_spent,
  COUNT(DISTINCT p.CategoryID) AS distinct_categories
FROM Orders o
JOIN OrderDetails od ON od.OrderID = o.OrderID
JOIN Products p ON p.ProductID = od.ProductID
JOIN Customers c ON c.CustomerID = o.CustomerID
WHERE o.OrderDate >= (NOW() - INTERVAL 6 MONTH)
GROUP BY c.CustomerID, c.FullName, c.Email
HAVING COUNT(DISTINCT p.CategoryID) >= 3
ORDER BY total_spent DESC
LIMIT 3;
