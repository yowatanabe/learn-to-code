# No.484

## 問題文

### ログファイル名の共通プレフィックス

あなたは複数のログファイル名を管理しています。

文字列配列 `files` が与えられます。

すべてのファイル名に共通する **最長の先頭文字列** を返してください。

共通する先頭文字列が存在しない場合は、空文字 `""` を返してください。

### 制約

* `1 <= len(files) <= 10^4`
* `0 <= len(files[i]) <= 200`
* `files[i]` は英小文字、数字、`.`、`-` からなる

## 実行例

### 例1

```python
files = ["app-error.log", "app-event.log", "app-export.log"]
```

すべて `"app-e"` から始まります。

出力:

```python
"app-e"
```

### 例2

```python
files = ["api.log", "db.log", "cache.log"]
```

共通する先頭文字列はありません。

出力:

```python
""
```

### 例3

```python
files = ["server", "server-1", "server-2"]
```

共通する先頭文字列は `"server"` です。

出力:

```python
"server"
```

## 実行結果

```
app-e

server
```
