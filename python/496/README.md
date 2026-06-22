# No.496

## 問題文

### ファイルパスからディレクトリ木の深さを求める

あなたはログ保存先のファイルパス一覧を分析しています。

文字列配列 `paths` が与えられます。

各要素は `/` 区切りのファイルパスです。

```python
"/app/log/error.log"
```

このようなパスは、以下の階層を表します。

```python
app -> log -> error.log
```

すべてのパスを1つのディレクトリ木として見たとき、**最も深い階層の深さ**を返してください。

先頭の `/` は深さに含めません。

## 実行例

### 例1

```python
paths = [
    "/app/log/error.log",
    "/app/log/access.log",
    "/db/mysql/slow/query.log"
]
```

最も深いパスは：

```python
/db/mysql/slow/query.log
```

深さは `4` です。

出力:

```python
4
```

### 例2

```python
paths = [
    "/api.log",
    "/db.log"
]
```

どちらも深さ `1` です。

出力:

```python
1
```

### 例3

```python
paths = [
    "/a/b",
    "/a/b/c",
    "/a/b/c/d"
]
```

最も深いパスは `/a/b/c/d` なので、出力は：

```python
4
```

## 実行結果

```
4
1
4
```
