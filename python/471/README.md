# No.471

## 問題文

### 最小の監視対象カバー範囲

あなたはログ内のイベント種別を監視しています。

文字列配列 `events` と文字列配列 `required` が与えられます。

`required` に含まれるすべてのイベント種別を少なくとも1回ずつ含む、`events` の連続部分配列のうち、**長さが最小のもの**を求めてください。

その最小長を返してください。存在しない場合は `0` を返してください。

### 制約

* `1 <= len(events) <= 10^5`
* `1 <= len(required) <= 10^5`
* `events[i]`, `required[i]` は英小文字の文字列
* `required` に重複はない

## 実行例

### 例1

```python
events = ["login", "db", "error", "cache", "db", "timeout"]
required = ["error", "timeout"]
```

`["error", "cache", "db", "timeout"]` が条件を満たす最短区間です。

出力:

```python
4
```

### 例2

```python
events = ["api", "db", "cache"]
required = ["api", "cache"]
```

`["api", "db", "cache"]` が必要です。

出力:

```python
3
```

### 例3

```python
events = ["api", "db"]
required = ["api", "error"]
```

`"error"` が存在しないため、条件を満たす区間はありません。

出力:

```python
0
```

## 実行結果

```
4
3
0
```
