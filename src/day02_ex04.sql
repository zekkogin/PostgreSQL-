SELECT m.pizza_name, pi.name AS pizzeria_name, m.price
FROM menu AS m
JOIN pizzeria AS pi ON pi.id = m.pizzeria_id
WHERE m.pizza_name LIKE 'mushroom pizza'
OR m.pizza_name LIKE 'pepperoni pizza'
ORDER BY m.pizza_name, pizzeria_name