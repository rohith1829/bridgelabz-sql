DELIMITER $$

CREATE PROCEDURE PlaceOrder(
  IN p_CustomerID INT,
  IN p_ProductID INT,
  IN p_Quantity INT,
  IN p_PaymentMethod VARCHAR(50),
  OUT p_OrderID INT
)
BEGIN
  DECLARE v_stock INT;
  DECLARE v_price DECIMAL(10,2);
  DECLARE v_order_id INT;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    SET p_OrderID = NULL;
    RESIGNAL;
  END;

  START TRANSACTION;

  SELECT Stock, Price INTO v_stock, v_price
  FROM Products
  WHERE ProductID = p_ProductID
  FOR UPDATE;

  IF v_stock IS NULL THEN
    ROLLBACK;
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Product not found';
  ELSEIF v_stock < p_Quantity THEN
    ROLLBACK;
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insufficient stock';
  ELSE
    INSERT INTO Orders (CustomerID, PaymentMethod)
    VALUES (p_CustomerID, p_PaymentMethod);

    SET v_order_id = LAST_INSERT_ID();

    INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price)
    VALUES (v_order_id, p_ProductID, p_Quantity, v_price);

    UPDATE Products
    SET Stock = Stock - p_Quantity
    WHERE ProductID = p_ProductID;

    COMMIT;

    SET p_OrderID = v_order_id;
  END IF;
END$$

DELIMITER ;
