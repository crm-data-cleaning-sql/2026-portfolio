<p align="center"># 2026-portfolio</p>

# 📊 SQL Data Portfolio: Case Studies & Business Solutions

Welcome to my data portfolio. This repository contains optimized SQL scripts and data cleaning workflows designed to solve real-world business infrastructure and data integrity challenges.

## 🕵️‍♂️ Case Study 1: [The SQL Murder Mystery](https://mystery.knightlab.com/#experienced)
* **Objective:** Query an unfamiliar database schema to trace witness accounts, cross-reference driver's licenses, and isolate a suspect based on fragmented event logs.
* **Skills Demonstrated:** Relational database joins (`INNER`/`LEFT JOIN`), string filtering (`LIKE`), data aggregation, and multi-table filtering.
* **Solution Script:** 


### Key Query Example (Finding the Suspect):
```sql
SELECT 
    p.name, 
    dl.plate_number, 
    f.check_in_date
FROM person p
JOIN drivers_license dl ON p.license_id = dl.id
JOIN get_fit_now_member m ON p.id = m.person_id
JOIN get_fit_now_check_in f ON m.id = f.membership_id
WHERE dl.plate_number LIKE '%H42W%' 
  AND m.membership_status = 'gold';
```
### Key Query Example (Finding the Real Villain):
```sql
SELECT name, annual_income as income, 
gender, eye_color as eyes, hair_color as hair
FROM income i
JOIN person p
  ON i.ssn = p.ssn 
JOIN drivers_license dl
  ON p.license_id = dl.id  
WHERE eye_color = "green"
AND hair = "red"
AND gender = "female"
ORDER BY income DESC
LIMIT 1
```


## 🕵️‍♂️ Case Study 2: [The Ghost Accounts & Broken Ledger](https://github.com/crm-data-cleaning-sql/2026-portfolio/tree/main/sql)
* **Objective:** Audit a corrupted relational CRM schema to track down "ghost" orphan transactions missing primary foreign key links and resolve split identity profiles across legacy customer tables. 
* **Skills Demonstrated:** Relational Schema and data set manipulation with safety update deletion. 
* **Solution Script:**

  ### Key Query Example (Identifying the Orphan Record):
 ```sql
SELECT 
    t.transaction_id,
    t.customer_id AS orphan_customer_id,
    t.amount,
    t.purchase_date
FROM transactions t
LEFT JOIN customers c 
    ON t.customer_id = c.customer_id
WHERE c.customer_id IS NULL;
```

  ### Key Query Example (Safety Reallocations):
 ```sql
-- Step A: Reassign transactions from duplicate ID 103 to primary ID 101
UPDATE transactions
SET customer_id = 101
WHERE customer_id = 103;

-- Step B: Reassign transactions from duplicate ID 105 to primary ID 102
UPDATE transactions
SET customer_id = 102
WHERE customer_id = 105;

-- Step C: Safely remove redundant profiles
DELETE FROM customers
WHERE customer_id IN (103, 105);
```



## 🛠️ Data Cleaning Competencies
* **Excel / Power Query:** Restructuring messy CSV exports, resolving data-type mismatches, and building dynamic Pivot Tables for executive summaries.
* **Data Integrity:** Writing SQL validation constraints to locate orphan records and drop duplicates.
