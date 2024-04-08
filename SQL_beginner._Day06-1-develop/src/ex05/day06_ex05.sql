COMMENT ON TABLE person_discounts IS 'Table contains information about discounts to customers for each pizzeria.';

COMMENT ON COLUMN person_discounts.discount IS 'Column contains the discount percentage rate for each pizzeria and person';
COMMENT ON COLUMN person_discounts.person_id IS 'Column contains information about FK id of person';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Column contains information about FK id of pizzeria';

SELECT obj_description('public.person_discounts'::regclass);