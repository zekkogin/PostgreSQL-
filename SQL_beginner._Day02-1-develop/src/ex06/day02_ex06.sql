SELECT m.pizza_name, pi.name
FROM menu AS m
JOIN pizzeria AS pi ON m.pizzeria_id = pi.id
JOIN person_order AS po ON po.menu_id = m.id
JOIN person AS p ON po.person_id = p.id
WHERE p.name = 'Denis' OR p.name = 'Anna'
ORDER BY m.pizza_name, pi.name;