INSERT INTO person_order (id,person_id, menu_id, order_date)
SELECT
    generate_series(MAX(po.id) + 1, MAX(po.id) + (SELECT MAX(id) FROM person)),
    generate_series(1, (SELECT MAX(id) FROM person)),
    (SELECT id FROM menu WHERE pizza_name = 'greek pizza') AS menu_id,
    '2022-02-25'
FROM person_order AS po;
