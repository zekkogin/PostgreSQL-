CREATE TABLE routes (
    point1 varchar(50) NOT NULL,
    point2 varchar(50) NOT NULL,
    cost integer
);

INSERT INTO routes(point1, point2, cost)
SELECT c1,c2,c3 FROM (
VALUES ('A', 'B', 10), ('A', 'D', 20), ('A', 'C', 15), ('B', 'D', 25), ('B', 'C', 35), ('C', 'D', 30),
       ('B', 'A', 10), ('A', 'D', 20), ('C', 'A', 15), ('D', 'B', 25), ('C', 'B', 35), ('D', 'C', 30)
) AS subquerry(c1,c2,c3);

WITH
    final AS (
    WITH RECURSIVE tree_traversal (point1, point2, path, cost) AS (
        SELECT
            ro1.point1,
            ro1.point2,
            ARRAY[ro1.point1, ro1.point2]::varchar[],
            ro1.cost
        FROM routes AS ro1
        WHERE ro1.point1 = 'A'
        UNION ALL
        SELECT
            tree.point1,
            ro2.point2,
            tree.path || ARRAY[ro2.point2],
            tree.cost + ro2.cost
        FROM tree_traversal AS tree
        JOIN routes AS ro2 ON tree.point2 = ro2.point1 AND ro2.point2 != ALL(tree.path)
    )
    SELECT * FROM tree_traversal
    WHERE array_length(path, 1) = 4
    ),
    final_min_cost AS (
    SELECT
        total_cost,
        tour
    FROM
        (SELECT
        cost +
        CASE
        WHEN RIGHT(path[array_upper(path, 1)], 1) = 'B' THEN 10
        WHEN RIGHT(path[array_upper(path, 1)], 1) = 'C' THEN 15
        WHEN RIGHT(path[array_upper(path, 1)], 1) = 'D' THEN 20
        ELSE 0
        END AS total_cost,
        array_append(path, 'A') AS tour
        FROM final) AS f
    )

    SELECT * FROM final_min_cost
    WHERE final_min_cost.total_cost IN (SELECT MIN(total_cost) FROM final_min_cost)
    ORDER BY 1,2;