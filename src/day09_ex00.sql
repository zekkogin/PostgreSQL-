CREATE TABLE person_audit (
  created TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
  type_event char(1) NOT NULL default 'I',
  row_id bigint NOT NULL,
  name varchar NOT NULL,
  age integer NOT NULL default 10,
  gender varchar NOT NULL default 'female',
  address varchar
);

ALTER TABLE person_audit ADD CONSTRAINT ch_type_event CHECK( type_event IN ('I', 'U', 'D') );

INSERT INTO person_audit(row_id, name, age, gender, address)
SELECT * FROM person;

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit()
RETURNS TRIGGER AS
    $BODY$
    BEGIN
    INSERT INTO person_audit(row_id, name, age, gender, address)
    VALUES (new.id, new.name, new.age, new.gender, new.address);
    RETURN new;
    END;
    $BODY$ LANGUAGE plpgsql;

CREATE TRIGGER "trg_person_insert_audit"
    AFTER INSERT ON person
    FOR EACH ROW
    EXECUTE PROCEDURE "fnc_trg_person_insert_audit"();

INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');