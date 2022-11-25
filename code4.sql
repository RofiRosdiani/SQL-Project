-- 4. Menghitung rincian sisa produk
SELECT 
       p.product_id,
       p.name AS product_name,
       p.quantity_in_stock,
       SUM(oi.quantity) AS total_sales_quantity,
       p.quantity_in_stock - SUM(oi.quantity) AS remaining_product_amount
FROM products p
JOIN order_items oi 
    ON p.product_id = oi.product_id
GROUP BY 1,2,3
ORDER BY 5

-- 4. Menghitung total sisa produk
SELECT 
      SUM(DISTINCT p.quantity_in_stock) AS 'total quantity in stock', 
      SUM(oi.quantity) AS 'total quantity sales',
      SUM(DISTINCT p.quantity_in_stock) - SUM(oi.quantity) AS 'remaining product',
      CAST(SUM(oi.quantity) / SUM(DISTINCT p.quantity_in_stock)*100 AS DECIMAL(4,2)) AS 'product sold %',
      CAST(100 - SUM(oi.quantity) / SUM(DISTINCT p.quantity_in_stock)*100 AS DECIMAL(4,2)) AS 'product loss %'
FROM products p
JOIN order_items oi 
    ON p.product_id = oi.product_id
