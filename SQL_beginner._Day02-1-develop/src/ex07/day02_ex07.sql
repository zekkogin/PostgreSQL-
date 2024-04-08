SELECT pi.name
FROM person_visits AS pv
JOIN person AS p ON pv.person_id = p.id
JOIN pizzeria AS pi ON pi.id = pv.pizzeria_id
JOIN menu AS m ON m.pizzeria_id = pi.id
WHERE pv.visit_date = '2022-01-08' AND m.price < 800 AND p.name = 'Dmitriy'