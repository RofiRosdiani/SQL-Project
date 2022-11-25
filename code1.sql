-- 1. Menghitung performance penjualan bulan January 2022
SELECT 
      MIN(oi.quantity*p.unit_price) AS min_sales,
      MAX(oi.quantity*p.unit_price) AS max_sales,
      ROUND (AVG(oi.quantity*p.unit_price), 0) AS avg_sales,
      SUM(oi.quantity*p.unit_price) AS total_sales 
FROM products p
JOIN order_items oi 
    ON p.product_id = oi.product_id
ORDER BY total_sales
