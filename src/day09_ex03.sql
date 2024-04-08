DROP TRIGGER IF EXISTS trg_person_update_audit ON person;
DROP TRIGGER IF EXISTS trg_person_insert_audit ON person;
DROP TRIGGER IF EXISTS trg_person_delete_audit ON person;

DROP FUNCTION IF EXISTS fnc_trg_person_update_audit();
DROP FUNCTION IF EXISTS fnc_trg_person_insert_audit();
DROP FUNCTION IF EXISTS fnc_trg_person_delete_audit();

TRUNCATE TABLE person_audit;

CREATE OR REPLACE FUNCTION fnc_trg_person_audit()
RETURNS TRIGGER AS
    $BODY$
    BEGIN
        IF (TG_OP = 'INSERT') THEN
            INSERT INTO person_audit(row_id, name, age, gender, address)
            VALUES (new.id, new.name, new.age, new.gender, new.address);
            RETURN new;
        ELSIF (TG_OP = 'UPDATE') THEN

            IF old.name <> new.name THEN
                INSERT INTO person_audit(type_event, row_id, name, age, gender, address)
                VALUES ('U', old.id, new.name, old.age, old.gender, old.address);
            END IF;
            IF old.age <> new.age THEN
                INSERT INTO person_audit(type_event, row_id, name, age, gender, address)
                VALUES ('U', old.id, old.name, new.age, old.gender, old.address);
            END IF;
            IF old.gender <> new.gender THEN
                INSERT INTO person_audit(type_event, row_id, name, age, gender, address)
                VALUES ('U', old.id, old.name, old.age, new.gender, old.address);
            END IF;
            IF old.address <> new.address THEN
                INSERT INTO person_audit(type_event, row_id, name, age, gender, address)
                VALUES ('U', old.id, old.name, old.age, old.gender, new.address);
            END IF;
            RETURN new;
        ELSE
            INSERT INTO person_audit(type_event, row_id, name, age, gender, address)
            VALUES ('D', old.id, old.name, old.age, old.gender, old.address);
            RETURN old;
        END IF;
    END;
    $BODY$ LANGUAGE plpgsql;

CREATE TRIGGER "trg_person_audit"
    AFTER DELETE OR INSERT OR UPDATE ON person
    FOR EACH ROW
    EXECUTE PROCEDURE "fnc_trg_person_audit"();

INSERT INTO person(id, name, age, gender, address)  VALUES (10,'Damir', 22, 'male', 'Irkutsk');
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
DELETE FROM person WHERE id = 10;