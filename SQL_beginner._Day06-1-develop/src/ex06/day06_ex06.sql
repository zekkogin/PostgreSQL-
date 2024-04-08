DROP SEQUENCE seq_person_discounts CASCADE;

CREATE SEQUENCE seq_person_discounts AS bigint
INCREMENT BY 1
NO MAXVALUE;

SELECT setval('seq_person_discounts', (SELECT max(id) FROM person_discounts));


ALTER TABLE ONLY person_discounts ALTER COLUMN id SET DEFAULT nextval('seq_person_discounts'::regclass);

INSERT INTO person_discounts(person_id, pizzeria_id, discount)
VALUES (5,2,23);

DELETE FROM person_discounts WHERE id > 15;