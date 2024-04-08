SELECT
    p.name,
    m.pizza_name,
    m.price,
    (100 - pd.discount)/100 * m.price AS discount_price,
    pi.name AS pizzeria_name
FROM person_discounts AS pd
JOIN person p on pd.person_id = p.id
JOIN pizzeria pi on pi.id = pd.pizzeria_id
JOIN menu m on pd.pizzeria_id = m.pizzeria_id
JOIN person_order po on m.id = po.menu_id AND pd.person_id = po.person_id
ORDER BY 1,2;