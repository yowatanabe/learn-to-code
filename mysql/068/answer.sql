-- `INNER JOIN`
SELECT
  Movies.MovieTitle,
  Directors.DirectorName
FROM
  Movies
  INNER JOIN Directors ON Movies.MovieID = Directors.MovieID;

-- `LEFT JOIN`
SELECT
  Movies.MovieTitle,
  Directors.DirectorName
FROM
  Movies
  LEFT JOIN Directors ON Movies.MovieID = Directors.MovieID;

-- `RIGHT JOIN`
SELECT
  Movies.MovieTitle,
  Directors.DirectorName
FROM
  Movies
  RIGHT JOIN Directors ON Movies.MovieID = Directors.MovieID;

-- `FULL OUTER JOIN`
SELECT
  Movies.MovieTitle,
  Directors.DirectorName
FROM
  Movies
  LEFT JOIN Directors ON Movies.MovieID = Directors.MovieID
UNION
SELECT
  Movies.MovieTitle,
  Directors.DirectorName
FROM
  Movies
  RIGHT JOIN Directors ON Movies.MovieID = Directors.MovieID;
