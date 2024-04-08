WITH pizzas AS (
    SELECT m.pizza_name AS pizza, pi.name AS pizzeria, m.price AS price
    FROM menu AS m
    JOIN pizzeria AS pi ON pi.id = m.pizzeria_id
)

SELECT pi1.pizza, pi1.pizzeria, pi2.pizzeria, pi1.price
FROM pizzas AS pi1
JOIN pizzas AS pi2 ON pi1.pizza = pi2.pizza
WHERE pi1.pizzeria <> pi2.pizzeria AND pi1.price = pi2.price
ORDER BY pi1.pizza