WITH ranked_customers AS (
    SELECT 
        customer_id,
        first_name,
        last_name,
        email,
        created_at,
        ROW_NUMBER() OVER (
            PARTITION BY first_name, last_name 
            ORDER BY created_at ASC, customer_id ASC
        ) AS row_num
    FROM customers
)
SELECT 
    customer_id,
    first_name,
    last_name,
    email,
    CASE 
        WHEN row_num = 1 THEN 'KEEP (Primary Profile)'
        ELSE 'DELETE / MERGE (Duplicate)'
    END AS action_status
FROM ranked_customers
ORDER BY last_name, row_num;