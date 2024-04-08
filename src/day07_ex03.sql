WITH
    visits AS (
    SELECT pi.name, COUNT(pizzeria_id) AS count_visits
    FROM person_visits
    JOIN pizzeria pi ON person_visits.pizzeria_id = pi.id
    GROUP BY pi.name),
    orders AS (
    SELECT pi.name, COUNT(pizzeria_id) AS count_orders
    FROM person_order
    JOIN menu m ON m.id = person_order.menu_id
    JOIN pizzeria pi ON m.pizzeria_id = pi.id
    GROUP BY pi.name
    )

    SELECT
        o.name,
        o.count_orders + v.count_visits AS total_count
    FROM orders AS o
    FULL JOIN visits AS v ON o.name = v.name
    ORDER BY 2 DESC, 1 ASC