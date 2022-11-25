-- 3. Menghitung produk yang paling banyak terjual
SELECT 
       p.product_id,
       p.name AS product_name,
       SUM(p.quantity_in_stock) AS quantity_in_stock,
       SUM(oi.quantity) AS total_sales_quantity,
       SUM((oi.quantity / p.quantity_in_stock)*100) AS persentage
FROM products p
JOIN order_items oi 
    ON p.product_id = oi.product_id
GROUP BY 1,2
ORDER BY 5
