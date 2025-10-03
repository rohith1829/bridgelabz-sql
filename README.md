# Database Management System Summary

This document summarizes the core functions of a database system designed to manage and report on **insurance-related data**, including customers, policies, agents, and claims. The SQL queries provided are used for both data maintenance and generating business reports.

---

### Key Database Operations and Their Purpose

#### Data Maintenance & Cleanup
* **`TRUNCATE TABLE` & `DROP TABLE`**: These commands are used for **database schema maintenance**.
    * `TRUNCATE TABLE Temp_Claims;` quickly and permanently deletes all data from the `Temp_Claims` table.
    * `DROP TABLE Old_Agents;` removes the entire `Old_Agents` table from the database.
* **`DELETE FROM Claims ...`**: This is used for **targeted data removal**. The queries show a focus on cleaning up the `Claims` table by removing old records (older than 5 years) and specific `Closed` claims with a `0` claim amount.

#### Data Retrieval & Reporting
* **`SELECT` with `JOIN`s**: The queries extensively use `JOIN` operations to combine data from multiple tables for comprehensive reports.
    * **`INNER JOIN`**: Used to find only matching records. For example, `INNER JOIN` on `Customers` and `Policies` finds only the customers who have a policy.
    * **`LEFT JOIN`**: Used to get all records from one table and matching records from another. For example, `LEFT JOIN` on `Customers` and `Policies` gets all customers, and their policies if they have one. This is crucial for reports that need to show all customers, including those with no policies.
* **`CONCAT()`**: This function is used to combine the `first_name` and `last_name` of agents into a single `agent_name` column, making the report output more readable.

---

### Specific Query Analysis

The provided queries show a clear focus on two key business reports:

1.  **Customer & Policy Reporting**: Queries on `Customers` and `Policies` are used to answer questions like:
    * Which customers have a policy? (using `INNER JOIN`)
    * Which customers do we have in the system, and do they have a policy? (using `LEFT JOIN`)

2.  **Agent Performance & Claims Tracking**: The most complex query (`SELECT ... FROM Customers LEFT JOIN Policies LEFT JOIN Agents LEFT JOIN Claims ...`) demonstrates the ability to link a claim directly back to the customer and the agent who sold the policy. This is vital for tracking agent performance, a policy's claim history, and the overall status of a claim.
