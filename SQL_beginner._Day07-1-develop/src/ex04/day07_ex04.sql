WITH
    visits AS (
    SELECT p.name, COUNT(pizzeria_id) AS count_visits
    FROM person_visits
    JOIN person p on person_visits.person_id = p.id
    GROUP BY p.name)

    SELECT
        name,
        count_visits
    FROM visits
    GROUP BY name, count_visits
    HAVING count_visits > 3