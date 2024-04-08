insert into currency
values (100, 'EUR', 0.85, '2022-01-01 13:29');

insert into currency
values (100, 'EUR', 0.79, '2022-01-08 13:29');

CREATE OR REPLACE FUNCTION fnc_find_need_date(current timestamp, currussy varchar)
    RETURNS timestamp
    LANGUAGE SQL
AS
$$
SELECT coalesce((SELECT updated FROM (
					SELECT updated, min(current - updated) AS m FROM currency
                    WHERE updated < current AND name = currussy
                    GROUP BY updated
                    ORDER BY m
                    LIMIT 1) AS kek),
               	(SELECT updated FROM (
					SELECT updated, min(updated - current) AS m FROM currency
                    WHERE updated >= current AND name = currussy
                    GROUP BY updated
                    ORDER BY m
                    LIMIT 1) AS kek)
           );
$$;

SELECT DISTINCT coalesce("user".name, 'not defined') AS name,
       coalesce("user".lastname, 'not defined') AS last_name,
       currency.name AS currency_name, money*currency.rate_to_usd AS currency_in_usd
FROM "user"
RIGHT JOIN balance on "user".id = balance.user_id
JOIN currency on balance.currency_id = currency.id
WHERE currency.updated = fnc_find_need_date(balance.updated, currency.name)
ORDER BY 1 DESC, 2, 3;