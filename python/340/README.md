# No.340

## 問題: ノード間の最短変換回数（Word Ladder）

同じ長さの単語 `beginWord`、`endWord` と、辞書 `wordList` が与えられます。

1回の変換では **単語の1文字だけ** を変更できます。ただし変更後の単語は `wordList` に含まれていなければなりません。

> `beginWord` から `endWord` へ到達するための **最短変換回数**（単語数でカウント）を返してください。
> 到達できない場合は `0` を返してください。

※ 変換回数は「経路に含まれる単語の個数」とします。
例: `hit -> hot -> dot -> dog -> cog` は **5**。

### 制約（目安）

* `1 ≤ len(beginWord) = len(endWord) ≤ 10`
* `1 ≤ len(wordList) ≤ 10^4`
* `wordList[i]` は小文字英字のみ
* `beginWord` は `wordList` に含まれないことがある

時間計算量は工夫して **おおむね O(N * L^2)** 程度を目指してください。

## 実行例

```python
# 例1
beginWord = "hit"
endWord = "cog"
wordList = ["hot","dot","dog","lot","log","cog"]
# hit -> hot -> dot -> dog -> cog （5）
# 出力: 5

# 例2
beginWord = "hit"
endWord = "cog"
wordList = ["hot","dot","dog","lot","log"]
# "cog" が辞書にないので到達不可
# 出力: 0

# 例3
beginWord = "a"
endWord = "c"
wordList = ["a","b","c"]
# a -> c （2）
# 出力: 2
```

## 実行結果

```
例1 入力: beginWord='hit', endWord='cog', wordList=['hot', 'dot', 'dog', 'lot', 'log', 'cog']
例1 出力: 5 (期待値: 5)
------------------------------------------------------------
例2 入力: beginWord='hit', endWord='cog', wordList=['hot', 'dot', 'dog', 'lot', 'log']
例2 出力: 0 (期待値: 0)
------------------------------------------------------------
例3 入力: beginWord='a', endWord='c', wordList=['a', 'b', 'c']
例3 出力: 2 (期待値: 2)
------------------------------------------------------------
```
