WITH
person_live AS (
    SELECT p.name AS name, p.id AS id, p.address AS address
    FROM
    person AS p
    )

SELECT pl.name, p.name, pl.address
FROM person AS p
JOIN person_live AS pl ON pl.address = p.address AND pl.id > p.id
ORDER BY 1,2,3