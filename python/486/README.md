# No.486

## 問題文

### 圧縮されたログパターンを展開する

文字列 `pattern` が与えられます。

`pattern` には、次の形式の圧縮表現が含まれます。

```python
数字[文字列]
```

これは、`文字列` を `数字` 回繰り返すことを意味します。

圧縮表現は入れ子になることがあります。
展開後の文字列を返してください。

## 実行例

### 例1

```python
pattern = "3[ab]"
```

出力:

```python
"ababab"
```

### 例2

```python
pattern = "2[a3[b]]"
```

`3[b]` は `"bbb"` なので、`a3[b]` は `"abbb"`。
それを2回繰り返します。

出力:

```python
"abbbabbb"
```

### 例3

```python
pattern = "x2[yz]w"
```

出力:

```python
"xyzyzw"
```

## 実行結果

```
ababab
abbbabbb
xyzyzw
```
