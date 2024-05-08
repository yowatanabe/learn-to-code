SELECT
  movie_title,
  COUNT(*) AS session_count
FROM
  movie_sessions
GROUP BY
  movie_title
HAVING
  SUM(revenue) >= 1000;
