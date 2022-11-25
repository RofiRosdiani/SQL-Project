-- 5. Tim Sales ingin memberikan merchandise kepada pelanggan yang meraih point lebih dari 1.500
SELECT *
FROM customers 

SELECT 
       customer_id,
       CONCAT(first_name,' ', last_name) AS full_name,
       phone,
       address,
       points 
FROM customers 
WHERE points > 1500
ORDER BY points DESC
