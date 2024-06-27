-- PostsテーブルのPostDate列にインデックスを作成
CREATE INDEX idx_post_date ON Posts (PostDate);

-- PostsテーブルのUserID列にインデックスを作成
CREATE INDEX idx_user_id ON Posts (UserID);

-- クエリを変更
SELECT
  u.UserName,
  COUNT(p.PostID) AS PostCount
FROM
  (
    SELECT
      PostID,
      UserID
    FROM
      Posts
    WHERE
      PostDate BETWEEN '2022-01-01' AND '2022-03-31'
  ) p
  JOIN Users u ON p.UserID = u.UserID
GROUP BY
  u.UserName
ORDER BY
  PostCount DESC;
