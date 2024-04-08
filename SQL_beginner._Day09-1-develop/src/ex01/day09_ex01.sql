CREATE OR REPLACE FUNCTION fnc_trg_person_update_audit()
RETURNS TRIGGER AS
    $BODY$
    BEGIN
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
    END;
    $BODY$ LANGUAGE plpgsql;

CREATE TRIGGER "trg_person_update_audit"
    AFTER UPDATE ON person
    FOR EACH ROW
    EXECUTE PROCEDURE "fnc_trg_person_update_audit"();

UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;