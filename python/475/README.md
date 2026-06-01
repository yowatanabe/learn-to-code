# No.475

## 問題文

### 障害対応ログの部分列一致

あなたは障害対応の操作ログを分析しています。

文字列 `source` と `target` が与えられます。

`source` からいくつかの文字を削除して、`target` と同じ文字列を作れるかを判定してください。文字の順番は変えてはいけません。

作れる場合は `True`、作れない場合は `False` を返してください。

### 制約

* `0 <= len(source) <= 10^5`
* `0 <= len(target) <= 10^5`
* `source` と `target` は英小文字のみ

## 実行例

### 例1

```python
source = "deployrollback"
target = "debug"
```

`source` から順番を保って `"debug"` を作ることはできません。

出力:

```python
False
```

### 例2

```python
source = "database"
target = "data"
```

`"data"` は `source` の部分列です。

出力:

```python
True
```

### 例3

```python
source = "incident"
target = "ice"
```

`i -> c -> e` の順で選べます。

出力:

```python
True
```

## 実行結果

```
False
True
True
```
