CREATE UNIQUE INDEX idx_person_order_order_date ON person_order (person_id, menu_id, order_date)
WHERE order_date = '2022-01-01';

EXPLAIN ANALYSE
SELECT person_id, menu_id, order_date FROM person_order
WHERE order_date = '2022-01-01'

