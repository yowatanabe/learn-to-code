# No.155

## 問題文：部分配列の中央値の最大値

整数の配列 `nums` が与えられます。長さが **奇数** のすべての連続部分配列について、その**中央値**を求めてください。そして、それらの中央値の中で **最大の値** を返す関数を実装してください。

中央値とは、数列を昇順に並べたときの中央の値です。

### 実行例：

```
nums = [1, 3, 2, 7, 4, 6]
出力: 7

説明:
奇数長のすべての連続部分配列とその中央値を列挙します：

・長さ 1
  ・[1], [3], [2], [7], [4], [6] → 中央値: 1, 3, 2, 7, 4, 6

・長さ 3
  ・ [1, 3, 2] → sorted: [1,2,3] → 中央: 2
  ・[3, 2, 7] → sorted: [2,3,7] → 中央: 3
  ・[2, 7, 4] → sorted: [2,4,7] → 中央: 4
  ・[7, 4, 6] → sorted: [4,6,7] → 中央: 6

・長さ 5
  ・[1, 3, 2, 7, 4] → sorted: [1,2,3,4,7] → 中央: 3
  ・[3, 2, 7, 4, 6] → sorted: [2,3,4,6,7] → 中央: 4

全中央値 = [1, 3, 2, 7, 4, 6, 2, 3, 4, 6, 3, 4]
最大値 = 7
```
