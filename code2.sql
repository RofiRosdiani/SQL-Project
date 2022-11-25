-- 2. Produk yang menghasilkan penjualan tertinggi dan terendah / rincian total penjualan per produk
SELECT p.product_id,
       p.name AS product_name,
       p.unit_price AS price,
       SUM(oi.quantity) AS total_quantity,
       SUM(oi.quantity*p.unit_price) AS total_sales
FROM products p
JOIN order_items oi 
    ON p.product_id = oi.product_id
GROUP BY 1,2,3
ORDER BY total_sales
