CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
RETURNS SETOF integer
AS $$
WITH RECURSIVE fib(a,b) AS (
        VALUES(0,1)
    UNION ALL
        SELECT greatest(a,b), a + b as a from fib
        WHERE b < pstop
   )
SELECT a FROM fib;
$$ LANGUAGE SQL;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();