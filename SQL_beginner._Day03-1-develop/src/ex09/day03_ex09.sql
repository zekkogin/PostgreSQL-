INSERT INTO person_visits (id,person_id, pizzeria_id, visit_date)
VALUES
    ((SELECT MAX(id) + 1 from person_visits),
    (SELECT id FROM person WHERE name = 'Denis'),
    (SELECT id FROM pizzeria WHERE name = 'Dominos'),
    '2022-02-24'),
    ((SELECT MAX(id) + 2 from person_visits),
    (SELECT id FROM person WHERE name = 'Irina'),
    (SELECT id FROM pizzeria WHERE name = 'Dominos'),
    '2022-02-24');