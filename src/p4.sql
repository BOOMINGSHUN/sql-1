Problem 4 - Update Product Price
With reference to tables created in Problem 1, write an SQL query to update the price of a specific product by specifying the product_id.

Bonus: Modify the query to update the price of all products by increasing it by 10%.

Solution:

# Update the price of a specific product (e.g., product_id = 501)
UPDATE inventories
SET price = 1350.00
WHERE product_id = 501;

Bonus: Update All Product Prices by 10%

UPDATE inventories
SET price = price * 1.10;




