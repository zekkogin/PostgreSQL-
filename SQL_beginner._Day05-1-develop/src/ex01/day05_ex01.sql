SET enable_seqscan = false;

EXPLAIN ANALYSE
SELECT
    m.pizza_name,
    pi.name AS pizzeria_name
FROM menu m
JOIN pizzeria pi on m.pizzeria_id = pi.id;
