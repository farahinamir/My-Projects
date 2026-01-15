CREATE DATABASE IF NOT EXISTS bdmproject;
USE bdmproject;
CREATE TABLE customers
(
customer_id INT PRIMARY KEY,
first_name VARCHAR(255),
last_name VARCHAR(255),
city VARCHAR(255),
email VARCHAR(255),
phone_number VARCHAR(255)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.2/Uploads/cleaned_customers.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

CREATE TABLE orders
(
order_id INT PRIMARY KEY,
order_date DATE,
customer_id INT,
total_price DOUBLE,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.2/Uploads/cleaned_orders.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

CREATE TABLE products
(
product_id INT PRIMARY KEY,
product_name VARCHAR(255),
category VARCHAR(255),
price DOUBLE,
supplier_id INT,
FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.2/Uploads/products.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

CREATE TABLE order_items
(
order_item_id INT PRIMARY KEY,
order_id INT,
product_id INT,
quantity INT,
price_at_purchase DOUBLE,
FOREIGN KEY (order_id) REFERENCES orders(order_id),
FOREIGN KEY (product_id) REFERENCES products(product_id)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.2/Uploads/order_items.csv'
INTO TABLE order_items
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

CREATE TABLE suppliers
(
supplier_id INT PRIMARY KEY,
supplier_name VARCHAR(255),
contact_name VARCHAR(255),
city VARCHAR(255),
phone_number VARCHAR(255),
email VARCHAR(255)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.2/Uploads/cleaned_suppliers.csv'
INTO TABLE suppliers
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

CREATE TABLE reviews
(
review_id INT PRIMARY KEY,
product_id INT,
customer_id INT,
rating INT,
review_text VARCHAR(255),
review_date DATE,
FOREIGN KEY (product_id) REFERENCES products(product_id),
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.2/Uploads/cleaned_reviews.csv'
INTO TABLE reviews
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

CREATE TABLE payments
(
payment_id INT PRIMARY KEY,
order_id INT,
payment_method VARCHAR(255),
amount DOUBLE,
transaction_status VARCHAR(255),
FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.2/Uploads/payments.csv'
INTO TABLE payments
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

CREATE TABLE shipments
(
shipment_id INT PRIMARY KEY,
order_id INT,
shipment_date DATE,
carrier VARCHAR(255),
tracking_number VARCHAR(255),
delivery_date DATE,
shipment_status VARCHAR(255),
FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.2/Uploads/cleaned_shipments.csv'
INTO TABLE shipments
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;







