SELECT 
  p.id AS person_id, 
  p.name, 
  p.age, 
  p.gender, 
  p.address, 
  pi.id AS pizzeria_id, 
  pi.name AS pizzeria_name, 
  pi.rating 
FROM 
  person AS p 
  CROSS JOIN pizzeria AS pi 
ORDER BY 
  person_id, 
  pizzeria_id;