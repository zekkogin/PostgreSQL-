1.
BEGIN;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SHOW TRANSACTION ISOLATION LEVEL;

2.
BEGIN;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SHOW TRANSACTION ISOLATION LEVEL;

2.
UPDATE pizzeria SET rating = 3.0 WHERE name = 'Pizza Hut';
COMMIT

1.
SELECT ... -- SHOW 3.6 , NOT UPDATED FROM 2 USER
COMMIT
SELECT ... -- SHOW 3.0, UPDATE FROM 2 USER