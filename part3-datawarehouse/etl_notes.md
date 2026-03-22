## ETL Decisions

### Decision 1 — Normalize date formats
Problem: The raw CSV had mixed date formats (`29/08/2023`, `12-12-2023`, `2023-02-05`, `20-02-2023`), which makes date-based grouping and joins unreliable.
Resolution: Converted all dates to ISO standard `YYYY-MM-DD`, and derived a consistent integer `date_key` in `YYYYMMDD` format for `dim_date` and fact table joins.

### Decision 2 — Standardize category casing
Problem: Category values were inconsistent (`electronics`, `Electronics`, `Grocery`, `Groceries`) causing split groups in analytics.
Resolution: Standardized to title-case categories (`Electronics`, `Clothing`, `Groceries`) before loading into `dim_product` and removed duplicates during dimension insertion.

### Decision 3 — Handle missing store city values
Problem: Some store records had NULL `store_city` (e.g., `Mumbai Central,`), which breaks referential integrity and reporting.
Resolution: Replaced missing city with known city name from other records for the same store (`Mumbai`) and ensured `dim_store` has complete non-null fields.
