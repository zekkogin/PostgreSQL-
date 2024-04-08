1.
BEGIN;
SHOW TRANSACTION ISOLATION LEVEL;

2.
BEGIN;
SHOW TRANSACTION ISOLATION LEVEL;

1.
UPDATE pizzeria SET rating = 5 WHERE id = 1;

2.
UPDATE pizzeria SET rating = 5 WHERE id = 2;

1.
UPDATE pizzeria SET rating = 5 WHERE id = 2; -- deadlock detected

2.
UPDATE pizzeria SET rating = 5 WHERE id = 1;

1.
COMMIT; -- ROLLBACK

2.
COMMIT; -- ROLLBACK
