SELECT p.name
FROM person_order AS po
JOIN person AS p ON po.person_id = p.id
JOIN menu AS m ON m.id = po.menu_id
WHERE (p.address = 'Samara' OR p.address = 'Moscow') 
AND p.gender = 'male'
AND (m.pizza_name = 'pepperoni pizza' OR m.pizza_name = 'mushroom pizza')
ORDER BY p.name DESC;