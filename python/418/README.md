# No.418

## 問題文

### 連続する障害日数の最長値

あなたはあるサービスの監視結果を日ごとに記録しています。

配列 `statuses` には、その日の状態が文字列で格納されています。

* `"ok"`: 正常
* `"error"`: 障害

あなたは **最大で1日分だけ `"ok"` を `"error"` に変更できる** とします。

このとき、**連続する `"error"` の長さの最大値** を求めてください。

関数はその最大値を返してください。

#### 制約

* `1 <= len(statuses) <= 10^5`
* `statuses[i]` は `"ok"` または `"error"`

## 実行例

### 例1

```python
statuses = ["error", "ok", "error", "error"]
```

1日だけ `"ok"` を `"error"` に変更すると、

```python
["error", "error", "error", "error"]
```

となるので、出力は

```python
4
```

### 例2

```python
statuses = ["ok", "ok", "error", "ok"]
```

3番目または4番目の `"ok"` を `"error"` に変更すると、
連続する `"error"` の最大長は

```python
2
```

です。

### 例3

```python
statuses = ["error", "error", "error"]
```

すでにすべて `"error"` なので、出力は

```python
3
```

## 実行結果

```
4
2
3
```
