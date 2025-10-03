DELIMITER $$

CREATE TRIGGER trg_orders_after_insert
AFTER INSERT ON Orders
FOR EACH ROW
BEGIN
  INSERT INTO OrderAudit (OrderID, CustomerID, OrderDate, ActionType, LoggedAt)
  VALUES (NEW.OrderID, NEW.CustomerID, NEW.OrderDate, 'INSERT', NOW());
END$$

DELIMITER ;
