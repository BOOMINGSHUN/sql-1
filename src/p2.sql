Problem 2 - Retrieve Orders from 'New York'
With reference to tables created in Problem 1, write an SQL query to retrieve the customer names, order dates, and total amounts for all orders placed by customers from the city 'New York'.

Bonus: Modify the query to include the average total amount per customer for orders placed in the city 'New York'.

Solution:

Approach: Use an INNER JOIN to connect orders and customers based on the common customer_id field

SELECT 
    c.customer_name, 
    o.order_date, 
    o.total_amount
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE c.city = 'New York';


Bonus: Average Total Amount per Customer
Approach: Use the GROUP BY clause on the customer name and apply the AVG() aggregate function to the total_amount

SELECT 
    c.customer_name, 
    AVG(o.total_amount) AS average_order_amount
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE c.city = 'New York'
GROUP BY c.customer_name;




