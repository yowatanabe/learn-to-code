# No.300

## 問題: 単語分割（Word Break）

英小文字からなる文字列 `s` と、**重複のない**英単語のリスト `wordDict` が与えられます。

> 文字列 `s` を、`wordDict` に含まれる単語だけを使って
> **1つ以上の単語の連結**として表現できるかどうか判定してください。

* `wordDict` の単語は何回使ってもよいものとします。
* 区切りは単語の境界でのみ可能です（文字の途中で切ることはできません）。
* 可能なら `True`, 不可能なら `False` を返してください。

### 制約（目安）

* `1 ≤ len(s) ≤ 300`
* `1 ≤ len(word) ≤ 20` （`wordDict` 内の各単語）
* `1 ≤ len(wordDict) ≤ 1000`
* 文字は `'a'`〜`'z'` のみ

時間計算量 **O(n²)** 程度（`n = len(s)`）の DP 解法を想定してください。

## 実行例

```python
# 例1
s = "leetcode"
wordDict = ["leet", "code"]
# "leetcode" = "leet" + "code" と分割できるので True
# 出力: True

# 例2
s = "applepenapple"
wordDict = ["apple", "pen"]
# "applepenapple" = "apple" + "pen" + "apple" と分割できるので True
# 出力: True

# 例3
s = "catsandog"
wordDict = ["cats", "dog", "sand", "and", "cat"]
# "cats and og" / "cat sand og" のようにしても "og" が辞書にない
# いかなる分割もすべての単語が辞書に載らない → False
# 出力: False

# 例4
s = "aaaaaaa"
wordDict = ["aaaa", "aaa"]
# "aaaaaaa" = "aaa" + "aaaa" などの分割が可能なので True
# 出力: True
```

## 実行結果

```
例1の入力: leetcode ['leet', 'code']
例1の結果: True
例2の入力: applepenapple ['apple', 'pen']
例2の結果: True
例3の入力: catsandog ['cats', 'dog', 'sand', 'and', 'cat']
例3の結果: False
例4の入力: aaaaaaa ['aaaa', 'aaa']
例4の結果: True
```
