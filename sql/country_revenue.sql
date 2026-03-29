SELECT
    c.country,
    SUM(oi.unit_price * oi.quantity) AS total_revenue
FROM order_items oi
JOIN orders o ON o.order_id = oi.order_id
JOIN customers c ON c.customer_id = o.customer_id
WHERE o.status = 'completed'
GROUP BY c.country
ORDER BY total_revenue DESC;