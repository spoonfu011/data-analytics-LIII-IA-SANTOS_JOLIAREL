
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