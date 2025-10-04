-- Queries
-- 1. Employees in given department
SELECT * FROM Employee e JOIN Department d ON e.dept_id=d.dept_id
WHERE d.dept_name='IT';

-- 2. Highest paid employee in each department
SELECT dept_id, name, salary
FROM Employee e
WHERE salary = (
   SELECT MAX(salary) FROM Employee WHERE dept_id = e.dept_id
);

-- 3. Update salary of Managers by 10%
UPDATE Employee SET salary = salary * 1.10 WHERE designation='Manager';

-- 4. Delete employees with salary < 30000
DELETE FROM Employee WHERE salary < 30000;