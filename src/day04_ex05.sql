CREATE VIEW v_price_with_discount AS
SELECT
    p.name,
    m.pizza_name,
    m.price,
    (m.price-0.1*m.price) AS discount_price
FROM person_order po
JOIN menu m on po.menu_id = m.id
JOIN person p on po.person_id = p.id
ORDER BY 1,2;
