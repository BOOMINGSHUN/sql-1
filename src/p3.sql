Problem 3 - Sales Analysis
With reference to tables created in Problem 1, write an SQL query to calculate the total quantity sold and the average quantity sold per order.

Bonus: Modify the query to include the total sales amount and average sales amount per order.


Solution

SELECT 
    SUM(quantity) AS total_quantity_sold,
    AVG(quantity) AS average_quantity_sold_per_order
FROM sales;


Bonus:

SELECT 
    # Aggregate functions to calculate totals and averages
    SUM(s.quantity) AS total_quantity_sold,
    AVG(s.quantity) AS average_quantity_sold_per_order,
    SUM(s.quantity * i.price) AS total_sales_amount,
    AVG(s.quantity * i.price) AS average_sales_amount_per_order
FROM sales s
# Join with inventories to retrieve the price for each product
JOIN inventories i ON s.product_id = i.product_id;
