1.
BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SHOW TRANSACTION ISOLATION LEVEL;

2.
BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SHOW TRANSACTION ISOLATION LEVEL;

1.
SELECT SUM(rating) from pizzeria;

2.
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
COMMIT;

1.
SELECT SUM(rating) from pizzeria; -- SHOW WITHOUT UPDATE FROM 2 USER
COMMIT;
SELECT SUM(rating) from pizzeria; -- UPDATED