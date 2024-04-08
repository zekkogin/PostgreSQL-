1.
BEGIN;
SHOW TRANSACTION ISOLATION LEVEL;

2.
BEGIN;
SHOW TRANSACTION ISOLATION LEVEL;

1.
SELECT SUM(rating) from pizzeria;

2.
UPDATE pizzeria SET rating = 1 WHERE name = 'Pizza Hut';
COMMIT;

1.
SELECT SUM(rating) from pizzeria; -- SHOW UPDATED FROM 2 USER
COMMIT;
SELECT SUM(rating) from pizzeria; -- SHOW UPDATED FROM 2 USER

2.
SELECT SUM(rating) from pizzeria;