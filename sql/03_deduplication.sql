SELECT 
    first_name, 
    last_name, 
    COUNT(*) AS profile_count
FROM customers
GROUP BY first_name, last_name
HAVING COUNT(*) > 1;