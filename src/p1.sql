Problem 1 - Table Creation (DDL)
Write SQL statements to create the following tables. Subsequent problems that follow will need to use these tables. 
Provide dummy data insert script for all tables.

Solution:

For Table Creation,

CREATE TABLE employees (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    position TEXT,
    department TEXT,
    salary NUMERIC(10, 2)
);

CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    customer_name TEXT NOT NULL,
    city TEXT
);

CREATE TABLE inventories (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT NOT NULL,
    quantity INTEGER DEFAULT 0,
    price NUMERIC(10, 2)
);

# Links to customers via customer_id
CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    order_date DATE,
    customer_id INTEGER,
    total_amount NUMERIC(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

# This serves as a junction/line-item table connecting orders and products
CREATE TABLE sales (
    order_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    sale_date DATE,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES inventories(product_id)
);


For Dummy Data Insertion Script,

INSERT INTO employees VALUES (1, 'Alice Smith', 'Manager', 'Sales', 75000);
INSERT INTO employees VALUES (2, 'Bob Jones', 'Associate', 'Sales', 50000);

INSERT INTO customers VALUES (101, 'TechCorp', 'New York');
INSERT INTO customers VALUES (102, 'DataSystems', 'San Francisco');

INSERT INTO inventories VALUES (501, 'Laptop', 50, 1200.00);
INSERT INTO inventories VALUES (502, 'Mouse', 200, 25.00);

INSERT INTO orders VALUES (1001, '2023-10-01', 101, 2400.00);

INSERT INTO sales VALUES (1001, 501, 2, '2023-10-01');



