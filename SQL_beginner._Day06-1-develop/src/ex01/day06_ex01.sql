INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
WITH
    all_orders AS (
    SELECT m.pizzeria_id, po.person_id, COUNT(po.person_id) AS count_person
    FROM person_order AS po
    JOIN menu AS m ON po.menu_id = m.id
    GROUP BY po.person_id, m.pizzeria_id
    )

    SELECT
    row_number() over (),
    person_id,
    pizzeria_id,
    CASE
    WHEN count_person = 1  THEN 10.5
    WHEN count_person = 2  THEN 22
    ELSE 30
    END AS discount
    FROM all_orders