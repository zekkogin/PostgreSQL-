WITH
    orders AS (
        SELECT p.address, pi.name, COUNT(pizzeria_id)

        FROM person_order
        JOIN person p ON person_order.person_id = p.id
        JOIN menu m ON person_order.menu_id = m.id
        JOIN pizzeria pi ON m.pizzeria_id = pi.id
        GROUP BY p.address, pi.name
    )

    SELECT * FROM orders
    ORDER BY 1,2