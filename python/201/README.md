# No.201

## 問題文

文字列 `s` と、単語辞書 `wordDict`（文字列の配列）が与えられます。

` s` を**辞書の単語をスペースなしで並べた連結**で表現できるなら `True`、できないなら `False` を返してください。

同じ単語を何度使ってもかまいません。

* `1 <= len(s) <= 10^5`
* `1 <= len(word) <= 20`（`word` は `wordDict` の要素）
* `wordDict` の要素数は最大 `10^4`

## 実行例

```
入力: s = "leetcode", wordDict = ["leet", "code"]
出力: True
説明: "leet" + "code" で構成できる。

入力: s = "applepenapple", wordDict = ["apple", "pen"]
出力: True
説明: "apple" + "pen" + "apple"。

入力: s = "catsandog", wordDict = ["cats","dog","sand","and","cat"]
出力: False
説明: どの分割でも辞書のみで構成できない。

入力: s = "aaaaaaa", wordDict = ["aaaa","aaa"]
出力: True
説明: "aaa" + "aaaa" などで可能。
```

## 実行結果

```
True
True
False
True
```
