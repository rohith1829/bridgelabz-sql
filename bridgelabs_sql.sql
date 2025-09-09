TRUNCATE TABLE Temp_Claims;

DELETE FROM Claims
WHERE claim_date < DATE_SUB(CURDATE(), INTERVAL 5 YEAR)
AND claim_id > 0;

DROP TABLE Old_Agents;

SHOW TABLES;

SELECT 
    c.first_name AS customer_first_name,
    c.last_name AS customer_last_name,
    p.policy_name
FROM Customers c
INNER JOIN Policies p ON c.customer_id = p.customer_id;

SELECT 
    c.first_name AS customer_first_name,
    c.last_name AS customer_last_name,
    p.policy_name
FROM Customers c
LEFT JOIN Policies p ON c.customer_id = p.customer_id;

SELECT 
    c.first_name AS customer_first_name,
    c.last_name AS customer_last_name,
    p.policy_name,
    CONCAT(a.first_name, ' ', a.last_name) AS agent_name,
    cl.claim_id,
    cl.claim_date,
    cl.claim_amount,
    cl.status AS claim_status
FROM Customers c
LEFT JOIN Policies p ON c.customer_id = p.customer_id
LEFT JOIN Agents a ON p.agent_id = a.agent_id
LEFT JOIN Claims cl ON p.policy_id = cl.policy_id;

DELETE FROM Claims
WHERE status = 'Closed'
  AND claim_amount = 0;

DROP TABLE IF EXISTS Temp_Policies;

SELECT 
    CONCAT(a.first_name, ' ', a.last_name) AS agent_name,
    p.policy_name
FROM Agents a
LEFT JOIN Policies p ON a.agent_id = p.agent_id;

