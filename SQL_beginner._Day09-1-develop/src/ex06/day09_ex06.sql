CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date
    (pperson VARCHAR DEFAULT 'Dmitriy',
    pprice NUMERIC DEFAULT 500,
    pdate DATE DEFAULT '2022-01-08')
RETURNS TABLE (
    name VARCHAR
)
AS $$
    SELECT DISTINCT pi.name
    FROM pizzeria pi
    JOIN menu m ON pi.id = m.pizzeria_id
    JOIN person_visits pv ON pi.id = pv.pizzeria_id
    JOIN person_order po on m.id = po.menu_id
    JOIN person p ON pv.person_id = p.id AND po.person_id = p.id
    WHERE p.name = pperson AND m.price < pprice AND pv.visit_date = pdate AND po.order_date = pdate;
$$ LANGUAGE SQL;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);
select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');