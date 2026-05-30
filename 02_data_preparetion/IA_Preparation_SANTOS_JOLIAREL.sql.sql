-- =====================================
-- PART B - DATA PREPARATION
-- =====================================

-- Remove duplicate transactions

DROP TABLE IF EXISTS transactions_clean;

CREATE TABLE transactions_clean AS
SELECT DISTINCT *
FROM transactions;


-- =====================================
-- Handle blank units
-- =====================================

UPDATE transactions_clean
SET units = 0
WHERE units IS NULL
   OR TRIM(units) = '';


-- =====================================
-- Clean Products Table
-- =====================================

UPDATE products
SET product_id = TRIM(product_id);

UPDATE products
SET product_name = TRIM(product_name);

UPDATE products
SET category = TRIM(category);

UPDATE products
SET category = UPPER(category);


-- =====================================
-- Clean Stores Table
-- =====================================

UPDATE stores
SET store_id = TRIM(store_id);

UPDATE stores
SET store_name = TRIM(store_name);

UPDATE stores
SET region = TRIM(region);

UPDATE stores
SET region = 'Unknown'
WHERE region IS NULL
   OR region = '';


-- =====================================
-- Correct Data Types
-- =====================================

DROP TABLE IF EXISTS transactions_final;

CREATE TABLE transactions_final AS
SELECT
    TRIM(transaction_id) AS transaction_id,
    date,
    TRIM(store_id) AS store_id,
    TRIM(product_id) AS product_id,
    CAST(units AS INTEGER) AS units,
    CAST(unit_price AS REAL) AS unit_price,
    CAST(total_amount AS REAL) AS total_amount
FROM transactions_clean;


-- =====================================
-- Check Date Range
-- =====================================

SELECT MIN(date) AS earliest_date,
       MAX(date) AS latest_date
FROM transactions_final;


-- =====================================
-- Filter Most Recent Full Year (2025)
-- =====================================

DROP TABLE IF EXISTS transactions_filtered;

CREATE TABLE transactions_filtered AS
SELECT *
FROM transactions_final
WHERE date LIKE '%2025%';


-- =====================================
-- Create Analysis Dataset
-- =====================================

DROP TABLE IF EXISTS analysis_dataset;

CREATE TABLE analysis_dataset AS
SELECT
    t.transaction_id,
    t.date,
    t.store_id,
    s.store_name,
    s.region,
    t.product_id,
    p.product_name,
    p.category,
    p.unit_cost,
    t.units,
    t.unit_price,
    t.total_amount
FROM transactions_filtered t
LEFT JOIN products p
    ON TRIM(t.product_id) = TRIM(p.product_id)
LEFT JOIN stores s
    ON TRIM(t.store_id) = TRIM(s.store_id);


-- =====================================
-- Verification Queries
-- =====================================

SELECT COUNT(*) AS transactions_clean_count
FROM transactions_clean;

SELECT COUNT(*) AS transactions_final_count
FROM transactions_final;

SELECT COUNT(*) AS transactions_filtered_count
FROM transactions_filtered;

SELECT COUNT(*) AS analysis_dataset_count
FROM analysis_dataset;

SELECT *
FROM analysis_dataset
LIMIT 10;

SELECT *
FROM analysis_dataset;

DELETE FROM stores
WHERE store_id = 'store_id';


SELECT
    t.transaction_id,
    t.date,
    t.store_id,
    s.store_name,
    s.region,
    t.product_id,
    p.product_name,
    p.category,
    p.unit_cost,
    t.units,
    t.unit_price,
    t.total_amount
FROM transactions_filtered t
LEFT JOIN products p
    ON TRIM(t.product_id) = TRIM(p.product_id)
LEFT JOIN stores s
    ON TRIM(t.store_id) = TRIM(s.store_id);