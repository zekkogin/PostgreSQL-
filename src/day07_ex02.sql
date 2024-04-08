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

    (SELECT
        o.name,
        o.count_orders,
        'order' AS action_type
    FROM orders AS o
    ORDER BY 2 DESC
    LIMIT 3)
        UNION ALL
    (SELECT
        v.name,
        v.count_visits,
        'visit' AS action_type
    FROM visits AS v
    ORDER BY 2 DESC
    LIMIT 3
    )
ORDER BY 3 ASC, 2 DESC