-- Find the name of the cats co-owned by both George Beatty and Melynda Abshire
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
            owners.first_name = 'George'
            AND owners.last_name = 'Beatty'
          )
      )
  )
  AND id IN (
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
            owners.first_name = 'Melynda'
            AND owners.last_name = 'Abshire'
          )
      )
  );

-- This works too!
-- SELECT
--   cats.name
-- FROM
--   cats
-- WHERE
--   id IN (
--     SELECT
--       cat_id
--     FROM
--       cat_owners
--     WHERE
--       owner_id IN (4, 5)
--     GROUP BY
--       cat_id
--     HAVING
--       COUNT(DISTINCT owner_id) = 2
--   );
