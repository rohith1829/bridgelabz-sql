-- Create Department table
CREATE TABLE Department (
  dept_id INT PRIMARY KEY,
  dept_name VARCHAR(50)
);

-- Create Employee table
CREATE TABLE Employee (
  emp_id INT PRIMARY KEY,
  name VARCHAR(50),
  designation VARCHAR(50),
  salary DECIMAL(10,2),
  dept_id INT,
  FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);


-- Insert Departments
INSERT INTO Department VALUES (1, 'HR'), (2, 'IT'), (3, 'Finance');

-- Insert Employees
INSERT INTO Employee VALUES
(101, 'Ravi', 'Manager', 75000, 1),
(102, 'Rohith', 'Analyst', 40000, 1),
(103, 'Varun', 'Clerk', 25000, 1),
(104, 'Kiran', 'Manager', 80000, 2),
(105, 'Sita', 'Developer', 45000, 2),
(106, 'Yaswant', 'Developer', 50000, 2),
(107, 'Anil', 'Manager', 70000, 3),
(108, 'Meena', 'Accountant', 35000, 3),
(109, 'Rakesh', 'Analyst', 32000, 3),
(110, 'Latha', 'Clerk', 28000, 3);
