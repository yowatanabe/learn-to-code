-- B-Treeインデックスの作成
-- デフォルトのInnoDBストレージエンジンでは、B-Treeインデックスが使用されます。`AccountNumber`列に対してB-Treeインデックスを作成し、番号による範囲検索を効率化します。
CREATE INDEX idx_account_number ON Accounts (AccountNumber);

-- *B-Treeインデックスを使ったクエリ
SELECT
  AccountID,
  Balance
FROM
  Accounts
WHERE
  AccountNumber BETWEEN '1234567890' AND '1234567892';

-- ハッシュインデックスの作成
-- ハッシュインデックスは、特定のストレージエンジン（例えば、Memoryエンジン）でサポートされ、等価検索に特化しています。範囲検索には向いていません。
CREATE INDEX idx_hash_account_number ON AccountsHash (AccountNumber) USING HASH;

-- ハッシュインデックスを使ったクエリ
SELECT
  AccountID,
  Balance
FROM
  AccountsHash
WHERE
  AccountNumber = '1234567892';

-- インデックスの確認
SHOW INDEX
FROM
  Accounts;

SHOW INDEX
FROM
  AccountsHash;
