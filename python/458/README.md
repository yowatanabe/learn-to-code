# No.458

## 問題文

### 同一ユーザーの重複リクエストを検出する

あなたはAPI Gatewayのアクセスログを分析しています。

文字列配列 `requests` が与えられ、`requests[i]` は `i` 番目のリクエストを送ったユーザーIDを表します。

整数 `k` が与えられたとき、

**同じユーザーIDが、距離 `k` 以内に2回以上出現するか** を判定してください。

存在する場合は `True`、存在しない場合は `False` を返してください。

ここで距離とはインデックス差です。

### 制約

* `1 <= len(requests) <= 10^5`
* `0 <= k <= 10^5`
* `requests[i]` は英数字文字列

## 実行例

### 例1

```python
requests = ["alice", "bob", "alice"]
k = 2
```

`"alice"` は index `0` と `2` に存在し、距離は `2` です。

出力:

```python
True
```

### 例2

```python
requests = ["api1", "api2", "api3", "api1"]
k = 2
```

`"api1"` の距離は `3` なので条件を満たしません。

出力:

```python
False
```

### 例3

```python
requests = ["u1", "u1"]
k = 1
```

距離は `1` です。

出力:

```python
True
```

## 実行結果

```
True
False
True
```
