-- Using subqueries, find the names of the cats whose owners are either George Beatty or Melynda Abshire
-- Your code here
SELECT DISTINCT
  name
FROM
  cats
WHERE
  id IN (
    SELECT
      cat_id
    FROM
      cat_owners
    WHERE
      owner_id IN (
        SELECT
          id
        FROM
          owners
        WHERE
          (
            first_name = 'George'
            AND last_name = 'Beatty'
          )
          OR first_name = 'Melynda'
          AND last_name = 'Abshire'
      )
  );
