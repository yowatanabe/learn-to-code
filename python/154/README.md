# No.154

## 問題文：配列内の和がゼロになる部分列

整数の配列 `nums` が与えられます。**連続する部分列（subarray）** のうち、**合計が0になる部分列の数**を返してください。

### 制約

* `1 <= nums.length <= 10^4`
* `-10^9 <= nums[i] <= 10^9`

## 実行例

### 例 1

```
入力: nums = [1, -1, 2, -2, 3]
出力: 3

説明:
以下の部分列の合計が0になる:
[1, -1], [2, -2], [1, -1, 2, -2]
```

### 例 2

```
入力: nums = [0, 0, 0]
出力: 6

説明:
全ての連続部分列が0:
[0], [0], [0], [0, 0], [0, 0], [0, 0, 0]
```

### 実行結果

```text
3
6
```
