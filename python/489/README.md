# No.489

## 問題文

### ログストリームの中央値を常に取得する

あなたはログ処理基盤で、レスポンスタイムを1件ずつ受け取ります。

次の2つの操作を持つクラス `MedianTracker` を実装してください。

* `add(value)`: 新しい値を追加する
* `median()`: これまで追加された値の中央値を返す

値の個数が偶数の場合、中央値は中央2つの平均とします。

## 実行例

```python
tracker = MedianTracker()

tracker.add(10)
print(tracker.median())  # 10

tracker.add(20)
print(tracker.median())  # 15.0

tracker.add(5)
print(tracker.median())  # 10

tracker.add(30)
print(tracker.median())  # 15.0
```

## 実行結果

```
10
15.0
10
15.0
```
