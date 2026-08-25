<p align="center"># 2026-portfolio</p>

# 📊 SQL Data Portfolio: Case Studies & Business Solutions

Welcome to my data portfolio. This repository contains optimized SQL scripts and data cleaning workflows designed to solve real-world business infrastructure and data integrity challenges.

## 🕵️‍♂️ Case Study 1: [The SQL Murder Mystery](https://mystery.knightlab.com/#experienced)
* **Objective:** Query an unfamiliar database schema to trace witness accounts, cross-reference driver's licenses, and isolate a suspect based on fragmented event logs.
* **Skills Demonstrated:** Relational database joins (`INNER`/`LEFT JOIN`), string filtering (`LIKE`), data aggregation, and multi-table filtering.
* **Solution Script:** [Link to your script file, e.g., `./murder_mystery_solution.sql`]


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

## 🕵️‍♂️ Case Study 2: 
* **Objective:**
* **Skills Demonstrated:**
* **Solution Script:**

## 🛠️ Data Cleaning Competencies
* **Excel / Power Query:** Restructuring messy CSV exports, resolving data-type mismatches, and building dynamic Pivot Tables for executive summaries.
* **Data Integrity:** Writing SQL validation constraints to locate orphan records and drop duplicates.
