WITH
    orders AS (
        SELECT p.address, ROUND(AVG(p.age),2) AS average, MAX(p.age) AS max, MIN(p.age) AS min
        FROM person AS p
        GROUP BY p.address
    )

    SELECT
        address,
        ROUND(max-(min/max::numeric), 2) AS formula,
        average,
        CASE
        WHEN max-(min/max::numeric) > average  THEN 'true'
        ELSE 'false'
        END AS comparison
    FROM orders
    ORDER BY 1;