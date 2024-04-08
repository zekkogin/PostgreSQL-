WITH
    orders AS (
    SELECT pi.name, COUNT(pizzeria_id) AS count_orders
    FROM person_order
    JOIN menu m ON m.id = person_order.menu_id
    JOIN pizzeria pi ON m.pizzeria_id = pi.id
    GROUP BY pi.name
    ),
    pizzeria_prices AS (
    SELECT pi.name, ROUND(AVG(price), 2) AS avg, MAX(price) AS max, MIN(price) AS min
    FROM menu AS m
    JOIN pizzeria AS pi on m.pizzeria_id = pi.id
    GROUP BY pi.name
    )

    SELECT o.name,
           o.count_orders AS count_of_orders,
           pp.avg AS average_price,
           pp.max AS max_price,
           pp.min AS min_price
    FROM orders AS o
    JOIN pizzeria_prices AS pp ON pp.name = o.name
    ORDER BY 1