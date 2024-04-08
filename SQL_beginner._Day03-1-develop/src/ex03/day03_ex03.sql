WITH male_visit AS (
    SELECT pi.name AS pizzeria
    FROM person_visits AS pv
    JOIN person AS p ON pv.person_id = p.id
    JOIN pizzeria AS pi ON pi.id = pv.pizzeria_id
    WHERE p.gender = 'male'
    ),

    female_visit AS (
    SELECT pi.name AS pizzeria
    FROM person_visits AS pv
    JOIN person AS p ON pv.person_id = p.id
    JOIN pizzeria AS pi ON pi.id = pv.pizzeria_id
    WHERE p.gender = 'female'
    ),

    male_visit_count AS (
    SELECT mv.pizzeria, COUNT(mv.pizzeria) AS count_visit
    FROM male_visit AS mv
    JOIN pizzeria AS pi ON pi.name = mv.pizzeria
    GROUP BY mv.pizzeria
    ),

    female_visit_count AS (
    SELECT fv.pizzeria, COUNT(fv.pizzeria) AS count_visit
    FROM female_visit AS fv
    JOIN pizzeria AS pi ON pi.name = fv.pizzeria
    GROUP BY fv.pizzeria
    )

SELECT fvc.pizzeria AS pizzeria_name
FROM male_visit_count AS mvc
JOIN female_visit_count AS fvc ON fvc.pizzeria = mvc.pizzeria
WHERE fvc.count_visit != mvc.count_visit
ORDER BY 1;