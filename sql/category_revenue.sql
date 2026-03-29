SELECT
    c.country,
    p.category,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM order_items oi
JOIN orders o ON o.order_id = oi.order_id
JOIN customers c ON c.customer_id = o.customer_id
JOIN products p ON p.product_id = oi.product_id
WHERE o.status = 'completed'
GROUP BY c.country, p.category
ORDER BY total_revenue DESC;