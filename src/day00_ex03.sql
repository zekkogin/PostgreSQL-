SELECT DISTINCT
  person_id 
FROM 
  person_visits 
WHERE 
  person_id = 2 or visit_date BETWEEN '2022-01-06' and '2022-01-09' 
ORDER BY 
  person_id desc;