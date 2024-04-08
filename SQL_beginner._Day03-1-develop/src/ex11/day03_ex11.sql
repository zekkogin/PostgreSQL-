UPDATE menu
SET price = price * 0.9
WHERE pizza_name = 'greek pizza';

ALTER TABLE menu
ALTER COLUMN price TYPE INTEGER;
