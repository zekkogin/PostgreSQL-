INSERT INTO person_visits(id, person_id, pizzeria_id, visit_date)
VALUES (
        (SELECT MAX(id)+1 FROM person_visits),
        (SELECT id from person WHERE name = 'Dmitriy'),
        (SELECT id from pizzeria WHERE name = 'Best Pizza'),
        '2022-01-08');

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;