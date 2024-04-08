WITH
kate_info AS (
    SELECT p.name AS name, pv.visit_date AS visit, pv.pizzeria_id AS pizzeria
    FROM
    person_visits AS pv
    JOIN person AS p ON p.id = pv.person_id
    WHERE p.name = 'Kate'
    )

SELECT m.pizza_name, m.price, pi.name AS pizzeria_name, ki.visit AS visit_date
FROM kate_info AS ki
JOIN menu AS m ON m.pizzeria_id = ki.pizzeria
JOIN pizzeria AS pi ON pi.id = ki.pizzeria
WHERE m.price BETWEEN 800 AND 1000
ORDER BY 1,2,3