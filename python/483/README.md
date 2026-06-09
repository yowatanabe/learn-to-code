# No.483

## 問題文

### 最短のロールバック手順を求める

あなたはデプロイ後のロールバック手順を管理しています。

文字列 `start` と `target` が与えられます。

1回の操作では、`start` 側の文字列に対して次のいずれかを行えます。

* 1文字を追加する
* 1文字を削除する

文字の置き換えはできません。

`start` を `target` に変換するために必要な**最小操作回数**を返してください。

### 制約

* `0 <= len(start), len(target) <= 1000`
* `start` と `target` は英小文字のみ

## 実行例

### 例1

```python
start = "deploy"
target = "debug"
```

両方に共通して順番を保って残せる最長部分列の1つは、

```python
"de"
```

です。

`start` から `"ploy"` の4文字を削除し、
`target` に足りない `"bug"` の3文字を追加します。

出力:

```python
7
```

### 例2

```python
start = "config"
target = "config"
```

すでに同じ文字列です。

出力:

```python
0
```

### 例3

```python
start = "abc"
target = "yabd"
```

共通して残せる最長部分列は `"ab"` です。
削除1回、追加2回が必要です。

出力:

```python
3
```

## 実行結果

```
7
0
3
```
