--Insert new cat named "Red" born this year
-- Your code here
INSERT INTO
  cats (name, birth_year)
VALUES
  ('Red', 2024);

-----------------------------------------------
SELECT
  *
FROM
  cats
WHERE
  name = 'Red'
  AND birth_year = 2024;

-----------------------------------------------
--Assign ownership of new cat to George Beatty using subqueries
-- Your code here
INSERT INTO
  cat_owners (cat_id, owner_id)
VALUES
  (
    (
      SELECT
        id
      FROM
        cats
      WHERE
        name = 'Red'
        AND birth_year = 2024
    ),
    (
      SELECT
        id
      FROM
        owners
      WHERE
        first_name = 'George'
        AND last_name = 'Beatty'
    )
  );

--Query to verify INSERTs worked properly
-- Your code here
SELECT
  owners.first_name,
  owners.last_name,
  cats.name,
  cats.birth_year
FROM
  cats
  JOIN cat_owners ON (cat_owners.cat_id = cats.id)
  JOIN owners ON (cat_owners.owner_id = owners.id)
WHERE
  owners.id IN (
    SELECT
      id
    FROM
      owners
    WHERE
      first_name = 'George'
      AND last_name = 'Beatty'
  )
  AND cats.id IN (
    SELECT
      id
    FROM
      cats
    WHERE
      name = 'Red'
      AND birth_year = 2024
  );
