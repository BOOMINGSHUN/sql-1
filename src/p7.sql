Problem 7 - Delete Customer
With reference to the tables created in Problem 1, write an SQL statement to delete a specific customer. You can specify the customer to delete by their customer_id.

Bonus: Modify the query to delete any related records associated with the customer being deleted to maintain data integrity.


Solution:

# Deleting a specific customer by ID
DELETE FROM customers
WHERE customer_id = 101;

Bonus:

#Redefine the foreign keys using ON DELETE CASCADE
  
# Re-creating the orders table with Cascade
CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    order_date DATE,
    customer_id INTEGER,
    total_amount NUMERIC(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) 
    ON DELETE CASCADE  # This handles the cleanup automatically
);

DELETE FROM customers
WHERE customer_id = 101;

# Automatically delete all child records (orders and sales) when delete the parent (customer)












