# No.445

## 問題文

### 依存サービスをすべて起動できるか

あなたはマイクロサービス群の起動順序を管理しています。サービスは `0` から `n - 1` の番号で表されます。

配列 `dependencies` が与えられます。

```python
dependencies[i] = [service, depends_on]
```

これは、`service` を起動するには、先に `depends_on` を起動する必要がある、という意味です。

すべてのサービスを起動できる場合は `True`、循環依存があり起動できない場合は `False` を返してください。

### 制約

* `1 <= n <= 10^5`
* `0 <= len(dependencies) <= 2 * 10^5`
* `0 <= service, depends_on < n`

## 実行例

### 例1

```python
n = 4
dependencies = [[1, 0], [2, 1], [3, 2]]
```

起動順序は例えば、

```python
0 -> 1 -> 2 -> 3
```

なので、出力は

```python
True
```

### 例2

```python
n = 3
dependencies = [[0, 1], [1, 2], [2, 0]]
```

循環依存があります。

```python
0 -> 1 -> 2 -> 0
```

したがって出力は

```python
False
```

### 例3

```python
n = 3
dependencies = [[1, 0]]
```

サービス `2` は独立しています。
すべて起動可能なので、出力は

```python
True
```

## 実行結果

```
True
False
True
```
