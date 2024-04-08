SELECT 
  DISTINCT d :: date AS missing_date 
FROM 
  generate_series('2022-01-01' :: timestamp, '2022-01-10' :: timestamp, '1 day') AS gen(d) 
  LEFT JOIN (
    SELECT 
      DISTINCT visit_date 
    FROM 
      person_visits 
    WHERE 
      person_id = 1 OR person_id = 2
  ) AS p ON p.visit_date = gen.d 
WHERE 
  p.visit_date is NULL 
ORDER BY 
  missing_date;