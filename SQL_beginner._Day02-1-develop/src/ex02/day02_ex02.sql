SELECT
    CASE WHEN p.name IS NULL THEN '-' ELSE p.name END AS person_name,
    pv.visit_date,
    CASE WHEN pi.name IS NULL THEN '-' ELSE pi.name END AS pizzeria_name
FROM person AS p
FULL JOIN (
    SELECT *
    FROM person_visits
    WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03'
) AS pv ON pv.person_id = p.id
FULL JOIN pizzeria AS pi ON pi.id = pv.pizzeria_id
ORDER BY person_name ASC, pv.visit_date ASC, pizzeria_name ASC;