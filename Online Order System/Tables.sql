-- Create Tables
CREATE TABLE Customer (
  cust_id INT PRIMARY KEY,
  cust_name VARCHAR(50),
  email VARCHAR(100)
);

CREATE TABLE Orders (
  order_id INT PRIMARY KEY,
  cust_id INT,
  order_date DATE,
  amount DECIMAL(10,2),
  FOREIGN KEY (cust_id) REFERENCES Customer(cust_id)
);

-- Insert Customers
INSERT INTO Customer VALUES
(1,'Ravi','ravi@gmail.com'),
(2,'Sita','sita@gmail.com'),
(3,'Rohith','rohith@gmail.com'),
(4,'Kiran','kiran@gmail.com'),
(5,'Varun','varun@gmail.com');

-- Insert Orders
INSERT INTO Orders VALUES
(101,1,'2025-09-01',5000),
(102,1,'2025-09-02',2000),
(103,2,'2025-09-03',7000),
(104,3,'2025-09-03',3000),
(105,3,'2025-09-04',1000),
(106,4,'2025-09-05',4000),
(107,2,'2025-09-06',8000),
(108,5,'2025-09-07',1500),
(109,1,'2025-09-08',2500),
(110,4,'2025-09-09',1000);
