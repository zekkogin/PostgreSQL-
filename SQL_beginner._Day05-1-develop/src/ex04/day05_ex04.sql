CREATE UNIQUE INDEX idx_menu_unique ON menu (pizzeria_id, pizza_name);

EXPLAIN ANALYSE
SELECT pizzeria_id, pizza_name
FROM menu
WHERE pizzeria_id = 5 OR pizza_name = 'greek pizza'