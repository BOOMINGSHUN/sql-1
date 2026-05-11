Problem 8 - Query Performance Optimization
Consider the following SQL query:

SELECT *
FROM employees
WHERE department = 'Sales' AND salary > 50000;

With reference to the tables created in Problem 1, analyze the query and propose an index or indexes that can significantly improve its performance.

Explain your reasoning behind choosing the specific column(s) for the index(es) and how they would enhance the execution of the query. Consider the selectivity of the columns, the order of the conditions, and any other factors that may impact the query performance.

Bonus: Discuss any potential trade-offs or drawbacks of implementing the suggested index(es), such as increased storage space or impact on write operations.


Proposed Index: Composite Index
CREATE INDEX idx_department_salary ON employees(department, salary);

Reasons:
1. Composite Index (Multi-column Index)
    A composite index is more powerful than two separate single-column indexes. The database engine can use the first part of the index to filter by department and then use the second part to quickly narrow down the salary range.
2. Selectivity
    The department column likely has low cardinality (few unique values), making it an excellent starting point for the index. By placing it first, the database engine can immediately jump to the 'Sales' section of the index, discarding all other departments.
3. Range Scanning
    Once the database identifies the 'Sales' records within the index, the salary column is already sorted within that 'Sales' subset. This allows the engine to perform an efficient range scan to find rows where salary > 50000 without having to touch the actual table data for non-matching rows.

Bonus:

Potential Trade-offs:
1. Write Performance Degradation
    Every time you INSERT, UPDATE, or DELETE a row in the employees table, the database must also update the idx_department_salary index. This adds overhead to write operations, which can slow down applications that perform frequent inserts.
2. Storage Overhead
    Indexes are separate data structures stored on disk. If the employees table is massive, this index will consume additional storage space, which can become significant if you have many indexes on a table.










