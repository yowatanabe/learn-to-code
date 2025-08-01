# No.159

### 問題文：部分配列の最大積

整数の配列 `nums` が与えられます。
連続する部分配列（長さは1以上）の中で、**積が最大となるものの積を返してください**。

部分配列とは、配列中の連続した要素からなる配列のことです。

### 制約

* `1 <= nums.length <= 10^4`
* `-10 <= nums[i] <= 10`
* 要素には負の数およびゼロが含まれる可能性があります。

### 実行例

#### 例 1:

```
入力: nums = [2, 3, -2, 4]
出力: 6
説明: [2, 3] の積が 6。
```

#### 例 2:

```
入力: nums = [-2, 0, -1]
出力: 0
説明: 最大の積は 0（単体の 0）。
```

#### 例 3:

```
入力: nums = [-2, 3, -4]
出力: 24
説明: 部分配列 [3, -4] の積が -12、[−2, 3, −4] の積が 24。
```

### 実行結果

```
6
0
24
```
