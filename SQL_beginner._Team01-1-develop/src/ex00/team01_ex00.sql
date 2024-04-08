with eur as (SELECT * FROM currency where name = 'EUR' order by updated DESC LIMIT 1),
usd as (SELECT * FROM currency where name ='USD' ORDER BY updated DESC LIMIT 1),
jpy as (SELECT * FROM currency where name ='JPY' ORDER BY updated DESC LIMIT 1),
all_result as (SELECT * FROM eur union SELECT * FROM usd union SELECT * FROM jpy)

SELECT 
(CASE WHEN "user".name IS NULL THEN 'not defined'
 WHEN "user".name IS NOT NULL THEN "user".name
 END) name,
 
(CASE WHEN "user".lastname IS NULL THEN 'not defined'
   WHEN "user".lastname IS NOT NULL THEN "user".lastname
 END) lastname,
 
balance.type,

sum(balance.money) volume,

(CASE WHEN all_result.name IS NULL THEN 'not defined'
   WHEN all_result.name IS NOT NULL THEN all_result.name
 END) currency_name,
 
(CASE WHEN all_result.rate_to_usd IS NULL THEN 1
   WHEN all_result.rate_to_usd IS NOT NULL THEN all_result.rate_to_usd
  END) last_rate_to_usd,
  
(CASE WHEN all_result.rate_to_usd IS NULL THEN 1 * sum(balance.money)
   WHEN all_result.rate_to_usd IS NOT NULL THEN all_result.rate_to_usd * sum(balance.money)
  END)::real total_volume_in_usd
  
FROM "user"
FULL JOIN balance ON balance.user_id = public."user".id
FULL JOIN all_result ON balance.currency_id = all_result.id
GROUP BY "user".name, "user".lastname, balance.type, currency_name, all_result.rate_to_usd
ORDER BY 1 DESC, 2, 3;