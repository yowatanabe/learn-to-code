# No.459

## 問題文

### 最小操作回数でサーバー名を修正する

あなたは設定ファイルに書かれたサーバー名を修正しています。

文字列 `current` と `target` が与えられます。

1回の操作では、以下のいずれかを実行できます。

* 1文字を挿入する
* 1文字を削除する
* 1文字を別の文字に置き換える

`current` を `target` に変換するために必要な**最小操作回数**を返してください。

### 制約

* `0 <= len(current), len(target) <= 500`
* `current` と `target` は英小文字のみからなる

## 実行例

### 例1

```python
current = "server"
target = "service"
```

一例として、

```python
server
↓ "r" を削除
serve
↓ "i" を挿入
servie
↓ "c" を挿入
service
```

最小操作回数は `3` です。

出力:

```python
3
```

### 例2

```python
current = "log"
target = "log"
```

すでに同じなので、出力は

```python
0
```

### 例3

```python
current = "db"
target = "database"
```

`"database"` にするには、最低でも6文字追加が必要です。

出力:

```python
6
```

## 実行結果

```
3
0
6
```
