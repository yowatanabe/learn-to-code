# No.427

## 問題文

### 文字列を1文字ずつ変換する最短ステップ数

あなたは障害対応手順の自動化を作っており、ある識別子を別の識別子へ変換したいとします。

文字列 `beginWord` から `endWord` へ変換することを考えます。

1回の操作では、**1文字だけ変更**できます。ただし、変更後の文字列は必ず `wordList` に含まれていなければなりません。

`beginWord` から `endWord` へ到達するために必要な**最小の変換回数**を返してください。変換できない場合は `0` を返してください。

### 条件

* 1回の操作で変更できるのは1文字だけ
* 変更後の文字列は `wordList` に存在する必要がある
* 途中経過の文字列もすべて `wordList` に含まれている必要がある
* `beginWord` 自体は `wordList` に含まれていなくてもよい

### 制約

* `1 <= len(beginWord) <= 10`
* `len(beginWord) == len(endWord)`
* `1 <= len(wordList) <= 5000`
* `wordList[i]` は英小文字のみ

## 実行例

### 例1

```python
beginWord = "hit"
endWord = "cog"
wordList = ["hot", "dot", "dog", "lot", "log", "cog"]
```

変換の一例は以下です。

```python
hit -> hot -> dot -> dog -> cog
```

変換回数は

```python
4
```

なので、出力は

```python
4
```

### 例2

```python
beginWord = "hit"
endWord = "cog"
wordList = ["hot", "dot", "dog", "lot", "log"]
```

`"cog"` が `wordList` に存在しないため、到達できません。

出力は

```python
0
```

### 例3

```python
beginWord = "cat"
endWord = "dog"
wordList = ["cot", "cog", "dot", "dog"]
```

変換の一例は以下です。

```python
cat -> cot -> cog -> dog
```

変換回数は

```python
3
```

なので、出力は

```python
3
```

## 実行結果

```
4
0
3
```
