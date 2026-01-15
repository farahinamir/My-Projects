SELECT 
    p.product_id,
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold,
    SUM(oi.quantity * oi.price_at_purchase) AS total_revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC; 

SELECT product_name, SUM(quantity) AS total_sold
FROM order_items
JOIN products ON order_items.product_id = products.product_id
GROUP BY product_name
ORDER BY total_sold ASC;

SELECT b.supplier_id, c.supplier_name, b.product_name, SUM(a.quantity) AS total_sold
FROM order_items a
JOIN products b ON a.product_id = b.product_id
JOIN suppliers c ON b.supplier_id = c.supplier_id
GROUP BY supplier_id, supplier_name, product_name
ORDER BY total_sold DESC;


