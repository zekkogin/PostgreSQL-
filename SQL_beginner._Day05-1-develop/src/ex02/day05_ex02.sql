CREATE INDEX idx_person_name ON person (UPPER(name));

SET enable_seqscan = false;

EXPLAIN ANALYSE
SELECT * FROM person WHERE UPPER(name) = 'ANNA';