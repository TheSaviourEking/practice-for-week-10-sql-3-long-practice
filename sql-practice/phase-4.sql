-- Give "Red" the cat one of every toy the other cats have
-- Your code here
-- Query spoiled cats reporting the most spoiled first
-- Your code here
INSERT INTO
  toys (cat_id, name)
SELECT
  (
    SELECT
      id
    FROM
      cats
    WHERE
      name = 'Red'
  ),
  name
FROM
  toys
WHERE
  cat_id <> (
    SELECT
      id
    FROM
      cats
    WHERE
      name = 'Red'
  )
GROUP BY
  toys.name;

SELECT
  'Cat:',
  cats.name,
  'owns',
  COUNT(toys.name) AS toys_count
FROM
  toys
  JOIN cats ON (cats.id = toys.cat_id)
GROUP BY
  cats.id
ORDER BY
  toys_count DESC;
