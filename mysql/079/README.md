# No.079

あなたは、あるジムの会員管理システムを担当しています。会員が利用したジムのセッション数、セッションの料金、各会員の合計支払額を管理するために、集計関数を使用して分析を行います。

### テーブル設計

**Members テーブル:**

| MemberID | MemberName |
|----------|------------|
| 1        | Alice      |
| 2        | Bob        |
| 3        | Charlie    |

**Sessions テーブル:**

| SessionID | MemberID | SessionDate   | Duration | Cost  |
|-----------|----------|---------------|----------|-------|
| 101       | 1        | 2024-10-01    | 60       | 1500  |
| 102       | 2        | 2024-10-02    | 90       | 2000  |
| 103       | 3        | 2024-10-03    | 45       | 1200  |
| 104       | 1        | 2024-10-04    | 60       | 1500  |
| 105       | 2        | 2024-10-05    | 60       | 1500  |
