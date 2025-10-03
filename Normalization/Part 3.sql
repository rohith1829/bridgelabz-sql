CREATE INDEX idx_orders_orderdate ON Orders (OrderDate);
CREATE INDEX idx_orders_customer_date ON Orders (CustomerID, OrderDate);

ALTER TABLE Customers ADD UNIQUE INDEX ux_customers_email (Email);

CREATE INDEX idx_products_category ON Products (CategoryID);
CREATE INDEX idx_products_cat_price_stock ON Products (CategoryID, Price, Stock);

CREATE INDEX idx_orderdetails_orderid ON OrderDetails (OrderID);
CREATE INDEX idx_orderdetails_productid ON OrderDetails (ProductID);
CREATE INDEX idx_orderdetails_orderid_price_qty ON OrderDetails (OrderID, ProductID, Quantity, Price);
