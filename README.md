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
### Key Query Example (Finding the "Real Villain"):
```sql
SELECT DISTINCT person_id FROM facebook_event_checkin
WHERE event_name LIKE "SQL%"
AND date BETWEEN "20171201" AND "20171231"
AND person_id IN("78881", "90700", "99716")
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

## 🛠️ Data Cleaning Competencies
* **Excel / Power Query:** Restructuring messy CSV exports, resolving data-type mismatches, and building dynamic Pivot Tables for executive summaries.
* **Data Integrity:** Writing SQL validation constraints to locate orphan records and drop duplicates.
