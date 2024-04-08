WITH andrey_visit AS (
    SELECT pi.name AS pizzeria, pv.visit_date AS visit, p.id AS name
    FROM person_visits AS pv
    JOIN person AS p ON pv.person_id = p.id
    JOIN pizzeria AS pi ON pi.id = pv.pizzeria_id
    WHERE p.name = 'Andrey'
)

SELECT DISTINCT av.pizzeria AS pizzeria_name
FROM andrey_visit AS av
JOIN person_order AS po ON po.person_id = av.name
WHERE po.order_date != av.visit