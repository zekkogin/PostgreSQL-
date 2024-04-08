WITH females_order_pepperoni AS (
    SELECT po.person_id AS id
    FROM
    person_order AS po
    JOIN person AS p ON p.id = po.person_id
    JOIN menu AS m ON po.menu_id = m.id
    WHERE p.gender = 'female'
    AND m.pizza_name = 'pepperoni pizza'
),
    females_order_cheese AS (
    SELECT po.person_id AS id
    FROM
    person_order AS po
    JOIN person AS p ON p.id = po.person_id
    JOIN menu AS m ON po.menu_id = m.id
    WHERE p.gender = 'female'
    AND (m.pizza_name = 'cheese pizza')
)

SELECT name
FROM person AS p
JOIN females_order_pepperoni ON females_order_pepperoni.id = p.id
JOIN females_order_cheese ON females_order_cheese.id = p.id
ORDER BY name;