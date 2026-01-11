# No.334

## 問題: 文字列をジグザグ変換せよ（Zigzag Conversion）

文字列 `s` と整数 `numRows` が与えられます。

`numRows` 行でジグザグ（Z字）に文字を配置し、**行ごとに左から右へ読み取った文字列**を返してください。

ジグザグ配置は次のように行います：

* 上から下へ `numRows` 行を移動しながら文字を置く
* 最下行に到達したら、今度は斜め上へ戻りながら文字を置く
* これを繰り返す

### 例（numRows=4）

`"PAYPALISHIRING"` は次のように配置されます（空白は省略）:

```
P     I    N
A   L S  I G
Y A   H R
P     I
```

行ごとに読むと `"PINALSIGYAHRPI"` になります。

### 制約（目安）

* `1 ≤ len(s) ≤ 10^5`
* `1 ≤ numRows ≤ 10^5`

時間計算量 **O(n)** を目指してください。

## 実行例

```python
# 例1
s = "PAYPALISHIRING"
numRows = 3
# 配置:
# P   A   H   N
# A P L S I I G
# Y   I   R
# 出力: "PAHNAPLSIIGYIR"

# 例2
s = "PAYPALISHIRING"
numRows = 4
# 出力: "PINALSIGYAHRPI"

# 例3
s = "AB"
numRows = 1
# 1行ならそのまま
# 出力: "AB"
```

## 実行結果

```
例1 入力: s='PAYPALISHIRING', numRows=3
例1 出力: 'PAHNAPLSIIGYIR'
--------------------------------------------------
例2 入力: s='PAYPALISHIRING', numRows=4
例2 出力: 'PINALSIGYAHRPI'
--------------------------------------------------
例3 入力: s='AB', numRows=1
例3 出力: 'AB'
--------------------------------------------------
```
