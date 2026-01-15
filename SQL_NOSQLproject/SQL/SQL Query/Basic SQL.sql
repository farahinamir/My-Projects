select * from customers;

select count(*) as Allcustomer
from customers;

SELECT city, COUNT(*) AS customers_by_city
FROM customers
GROUP BY city;

select * from order_items;

SELECT product_id, SUM(quantity*price_at_purchase) AS total_price
FROM order_items
GROUP BY product_id
order by total_price desc
limit 5;

select * from orders;

SELECT AVG(total_price) AS avg_order_value FROM orders;

select * from payments;

select transaction_status, sum(amount) as total_amount_CC
from payments
group by transaction_status;

select * from products;

SELECT category, product_name, price AS min_price
FROM products
WHERE price = (SELECT MAX(price) FROM products p2 WHERE p2.category = products.category);

select * from reviews;

select * from suppliers;




