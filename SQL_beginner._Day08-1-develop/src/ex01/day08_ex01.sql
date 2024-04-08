1.
BEGIN;
SHOW TRANSACTION ISOLATION LEVEL;

2.
BEGIN;
SHOW TRANSACTION ISOLATION LEVEL;

1.
UPDATE pizzeria SET rating = 4
WHERE name = 'Pizza Hut';

2.
UPDATE pizzeria SET rating = 3.6
WHERE name = 'Pizza Hut';           -- виснет терминал, ожидание коммита от 1 юзера

1.
COMMIT; -- апдейт второго юзера

2.
COMMIT: 