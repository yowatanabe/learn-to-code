# No.444

## 問題文

### APIレート制限を超えない最大リクエスト数

あなたはAPI Gatewayのレート制限を確認しています。整数配列 `requests` が与えられ、`requests[i]` は `i` 秒目に到着したリクエスト数を表します。

整数 `window` と `limit` が与えられたとき、**連続する `window` 秒間の合計リクエスト数の最大値**を求めてください。

ただし、その最大値が `limit` を超える場合は `"OVER_LIMIT"`、超えない場合はその最大値を返してください。

### 制約

* `1 <= window <= len(requests) <= 10^5`
* `0 <= requests[i] <= 10^4`
* `1 <= limit <= 10^9`

## 実行例

### 例1

```python
requests = [10, 20, 30, 5, 10]
window = 3
limit = 70
```

連続する3秒間の合計は、

```python
[10, 20, 30] = 60
[20, 30, 5] = 55
[30, 5, 10] = 45
```

最大値は `60` で、`limit` を超えていません。

出力は

```python
60
```

### 例2

```python
requests = [50, 30, 20, 10]
window = 2
limit = 70
```

連続する2秒間の合計は、

```python
[50, 30] = 80
[30, 20] = 50
[20, 10] = 30
```

最大値 `80` は `limit` を超えるため、出力は

```python
"OVER_LIMIT"
```

### 例3

```python
requests = [1, 2, 3, 4, 5]
window = 5
limit = 15
```

全体の合計は `15` で、`limit` を超えていません。

出力は

```python
15
```

## 実行結果

```
60
OVER_LIMIT
15
```
