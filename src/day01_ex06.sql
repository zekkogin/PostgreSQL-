SELECT DISTINCT 
    person_visits.visit_date AS action_date,
    person.name AS person_name
FROM
    person,
    person_visits,
    person_order
WHERE
    person.id = person_visits.person_id
    AND person.id = person_order.person_id
    AND person_visits.visit_date = person_order.order_date
ORDER BY
    action_date ASC, person_name DESC;