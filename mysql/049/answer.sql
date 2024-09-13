-- 1. `username`カラムに対するB-Treeインデックスの作成
CREATE INDEX idx_username ON users (username);

-- 2. `email`カラムに対するHashインデックスの作成
-- MySQLのInnoDBストレージエンジンではHashインデックスを直接サポートしていない。MEMORYストレージエンジンを使用することでHashインデックスを作成できる。
ALTER TABLE users ENGINE = MEMORY;

CREATE INDEX idx_email USING HASH ON users (email);

-- B-Treeインデックスの効果的なクエリ
-- usernameが'a'から始まるユーザーを検索
SELECT
  *
FROM
  users
WHERE
  username LIKE 'a%';

-- Hashインデックスの効果的なクエリ
-- emailが特定の値と一致するユーザーを検索
SELECT
  *
FROM
  users
WHERE
  email = 'bob@example.com';
