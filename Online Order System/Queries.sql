-- Queries
-- 1. Orders by a specific customer
SELECT * FROM Orders WHERE cust_id=1;

-- 2. Customer with highest total purchase
SELECT cust_id, SUM(amount) total FROM Orders GROUP BY cust_id
ORDER BY total DESC LIMIT 1;

-- 3. Customers with no orders
SELECT * FROM Customer c WHERE NOT EXISTS
(SELECT 1 FROM Orders o WHERE o.cust_id=c.cust_id);

-- 4. Average order value
SELECT AVG(amount) FROM Orders;