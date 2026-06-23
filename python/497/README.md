# No.497

## 問題文

### 設定変更の差分を最小化する

あなたは設定ファイルのバージョン差分を比較しています。

2つの文字列 `old_config` と `new_config` が与えられます。

1回の操作では、`old_config` に対して以下のいずれかを行えます。

* 1文字を挿入する
* 1文字を削除する
* 1文字を置換する

`old_config` を `new_config` に変換するために必要な**最小操作回数**を返してください。

## 実行例

### 例1

```python
old_config = "horse"
new_config = "ros"
```

変換例：

```python
horse -> rorse  # h を r に置換
rorse -> rose   # r を削除
rose -> ros     # e を削除
```

出力:

```python
3
```

### 例2

```python
old_config = "intention"
new_config = "execution"
```

出力:

```python
5
```

### 例3

```python
old_config = "same"
new_config = "same"
```

出力:

```python
0
```

## 実行結果

```
3
5
0
```
