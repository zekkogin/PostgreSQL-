WITH CTE AS (
SELECT p.name, COUNT(person_id) AS count_of_visits
FROM person_visits
JOIN person p on person_visits.person_id = p.id
GROUP BY p.name
ORDER BY 2 DESC
LIMIT 4)

SELECT * FROM CTE
ORDER BY 1 ASC