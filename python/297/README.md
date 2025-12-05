# No.297

## 問題: すべてのコースを履修できるか（Course Schedule）

あなたは `numCourses` 個のコースを受講しようとしています。
コースは `0` から `numCourses - 1` まで番号が振られています。

一部のコースには **履修の前提条件（prerequisite）** があり、
配列 `prerequisites` として次の形式で与えられます。

* `prerequisites[i] = [a, b]` は
  「コース `a` を受講するためには、先にコース `b` を修了している必要がある」
  ことを意味します（`b -> a` の有向辺とみなせる）。

あなたのタスクは：

> すべてのコース（0〜`numCourses-1`）を **履修可能かどうか** を判定し、
> 可能なら `True`、不可能なら `False` を返してください。

不可能になるのは、**前提条件に循環（サイクル）が存在する場合**です。

### 制約（目安）

* `1 ≤ numCourses ≤ 10^5`
* `0 ≤ prerequisites.length ≤ 10^5`
* `prerequisites[i].length == 2`
* `0 ≤ a, b < numCourses`

時間計算量は **O(numCourses + prerequisites.length)** 程度を目指してください。
全パスをバックトラックで総当りするような解法は TLE 想定です。

## 実行例

```python
# 例1
numCourses = 2
prerequisites = [[1, 0]]
# 0 を取ってから 1 を取ればよいので、すべてのコースを履修可能
# 出力: True

# 例2
numCourses = 2
prerequisites = [[1, 0], [0, 1]]
# 1 を取るには 0 が必要、0 を取るには 1 が必要 → 循環がある
# どちらも先に取れないので、すべてのコースを履修することは不可能
# 出力: False

# 例3
numCourses = 4
prerequisites = [[1, 0], [2, 1], [3, 2]]
# 0 -> 1 -> 2 -> 3 の順に取ればよい。循環はない。
# 出力: True

# 例4
numCourses = 3
prerequisites = []
# 前提条件がないので、どの順番でもすべて履修可能
# 出力: True
```

## 実行結果

```
例1の入力: 2 [[1, 0]]
例1の結果: True
例2の入力: 2 [[1, 0], [0, 1]]
例2の結果: False
例3の入力: 4 [[1, 0], [2, 1], [3, 2]]
例3の結果: True
例4の入力: 3 []
例4の結果: True
```
