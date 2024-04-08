SELECT DISTINCT
    p.name
FROM person_order AS po
JOIN person p ON po.person_id = p.id
ORDER BY 1