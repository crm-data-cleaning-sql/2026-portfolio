-- sql/02_orphan_audit.sql
SELECT t.transaction_id, t.customer_id
FROM transactions t
LEFT JOIN customers c ON t.customer_id = c.customer_id
WHERE c.customer_id IS NULL;