# No.171

## 問題文

**与えられた文字列 `s` と整数 `k` が与えられます。
`k` 回まで任意の文字を他の任意の1文字に置き換えることができるとき、
` s` に含まれる最長の同じ文字が連続する部分文字列の長さを求めてください。**


## 実行例

```
入力: s = "AABABBA", k = 1
出力: 4
説明: 1回の置換で「AABA**BBA**」のBをAに変えて「AAAA**BBA**」のようにし、"A"が4文字連続になる。

入力: s = "ABAB", k = 2
出力: 4
説明: 2回の置換で全て"A"または全て"B"にでき、最大4文字連続。

入力: s = "ABAA", k = 0
出力: 2
説明: 置換できないので"A"または"B"が2文字連続が最大。
```

### 実行結果

```
4
4
2
```
