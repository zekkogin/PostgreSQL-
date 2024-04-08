CREATE VIEW v_symmetric_union AS
WITH
    R AS (
    SELECT pv.person_id
    FROM person_visits AS pv
    WHERE pv.visit_date = '2022-01-02'
    ),
    S AS (
    SELECT pv.person_id
    FROM person_visits AS pv
    WHERE pv.visit_date = '2022-01-06'
    )

(SELECT * FROM R
EXCEPT
SELECT * FROM S)
UNION
(SELECT * FROM S
EXCEPT
SELECT * FROM R)
ORDER BY 1;
