Problem 5 - Department Statistics
With reference to tables created in Problem 1, write an SQL query to calculate the average salary for each department.

Bonus: Modify the query to calculate the highest salary for each department and retrieve the department name, highest salary, and the employee(s) with that salary.

Solution:

SELECT 
    department, 
    AVG(salary) AS average_salary
FROM employees
GROUP BY department;


Bonus: Highest Salary and Employee Name(s)

SELECT 
    e.department, 
    e.salary AS highest_salary, 
    e.name AS employee_name
FROM employees e
JOIN (
    # Subquery: Finds the maximum salary for each department
    SELECT department, MAX(salary) as max_salary
    FROM employees
    GROUP BY department
) AS dept_max ON e.department = dept_max.department 
              AND e.salary = dept_max.max_salary;





