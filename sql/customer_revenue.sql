WITH revenue_per_customer AS (
    SELECT
        c.country,
        c.customer_name,
        SUM(oi.quantity * oi.unit_price) AS total_revenue
    FROM order_items oi
    JOIN orders o ON o.order_id = oi.order_id
    JOIN customers c ON c.customer_id = o.customer_id
    WHERE o.status = 'completed'
    GROUP BY c.country, c.customer_name
)
SELECT
    country,
    customer_name,
    total_revenue
FROM revenue_per_customer
ORDER BY total_revenue DESC;