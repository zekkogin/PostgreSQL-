SELECT 'DROP VIEW ' || string_agg (table_name, ', ') || ' cascade;'
  FROM information_schema.views
 WHERE table_schema NOT IN ('pg_catalog', 'information_schema')
   AND table_name !~ '^pg_';

DROP VIEW v_persons_female, v_persons_male, v_generated_dates, v_symmetric_union, v_price_with_discount cascade;

DROP MATERIALIZED VIEW mv_dmitriy_visits_and_eats;