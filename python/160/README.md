# No.160

### 問題文：部分和が `k` になる個数

整数の配列 `nums` と整数 `k` が与えられます。
合計が `k` になる **連続する部分配列（サブアレイ）** の個数を求めてください。

部分配列は少なくとも1つ以上の要素を含む必要があります。

### 制約

* `1 <= nums.length <= 10^4`
* `-1000 <= nums[i] <= 1000`
* `-10^7 <= k <= 10^7`

### 実行例

#### 例 1:

```
入力: nums = [1,1,1], k = 2
出力: 2
説明: 2つの部分配列が合計2になる → [1,1] (index 0~1 と 1~2)
```

#### 例 2:

```
入力: nums = [1,2,3], k = 3
出力: 2
説明: [1,2] と [3] が該当。
```

### 実行結果

```
2
2
```
