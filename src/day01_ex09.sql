SELECT name
FROM pizzeria
WHERE id NOT IN
    (
        SELECT pizzeria_id AS id FROM person_visits
    );

SELECT name
FROM pizzeria pi
WHERE NOT EXISTS
    (
    SELECT pizzeria_id FROM person_visits
    WHERE pizzeria_id = pi.id
    );