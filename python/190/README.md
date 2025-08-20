# No.190

## 問題文

**`numCourses` 個のコース（0 ～ `numCourses-1`）と、先修関係 `prerequisites` が与えられます。
`prerequisites[i] = [a, b]` は「コース `a` を履修するにはコース `b` を先に修了している必要がある」ことを表します。
全てのコースを履修可能（= 依存の循環が存在しない）なら `True`、不可能なら `False` を返してください。**

* `1 <= numCourses <= 10^5`
* `0 <= len(prerequisites) <= 2 * 10^5`
* 先修関係は重複することがあります（同じ `[a, b]` が複数回出る可能性）。

## 実行例

```
入力: numCourses = 2, prerequisites = [[1,0]]
出力: True
説明: 0 -> 1 の順で履修すればよい（循環なし）。

入力: numCourses = 2, prerequisites = [[1,0],[0,1]]
出力: False
説明: 0 -> 1 -> 0 と循環しているため不可能。

入力: numCourses = 4, prerequisites = [[1,0],[2,1],[3,2]]
出力: True
説明: 0 -> 1 -> 2 -> 3 とトポロジカル順が取れる。

入力: numCourses = 3, prerequisites = [[0,1],[0,2],[1,2]]
出力: True
説明: 2 -> 1 -> 0 の順に履修可能（循環なし）。
```

## 実行結果

```
True
False
True
True
```
