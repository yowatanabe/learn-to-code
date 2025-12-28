# No.320

## 問題: 上位 K 個の要素を最適に選べ（Top K Frequent Words）

文字列配列 `words` と整数 `k` が与えられます。

> 出現回数が多い順に **k 個** の単語を返してください。
> ただし出現回数が同じ場合は、**辞書順（lexicographical order）で小さい単語を先**にします。

### 返却ルール

* まず **出現回数の降順**
* 同率なら **単語の昇順（辞書順）**

### 制約（目安）

* `1 ≤ len(words) ≤ 10^5`
* `1 ≤ len(words[i]) ≤ 10`
* `1 ≤ k ≤` 異なる単語数

## 実行例

```python
# 例1
words = ["i","love","leetcode","i","love","coding"]
k = 2
# 出現回数: i->2, love->2, coding->1, leetcode->1
# 2回の単語は i と love。辞書順で "i" が先。
# 出力: ["i", "love"]

# 例2
words = ["the","day","is","sunny","the","the","the","sunny","is","is"]
k = 4
# 出現回数: the->4, is->3, sunny->2, day->1
# 出力: ["the","is","sunny","day"]
```

## 実行結果

```
例1 入力: words=['i', 'love', 'leetcode', 'i', 'love', 'coding'], k=2
例1 出力: ['i', 'love']
----------------------------------------
例2 入力: words=['the', 'day', 'is', 'sunny', 'the', 'the', 'the', 'sunny', 'is', 'is'], k=4
例2 出力: ['the', 'is', 'sunny', 'day']
----------------------------------------
```
