from collections import deque
from typing import List


def num_islands(grid: List[List[str]]) -> int:
    """
    BFS（もしくはDFS）で連結成分を数える。
    - 未訪問の '1' を見つけたら島+1 としてキューに入れ、陸をすべて辿って水か訪問済みにする。
    - 再帰は深くなるとスタック制限にかかる可能性があるため、BFS(キュー)で実装。
    時間: O(mn), 追加メモリ: O(mn)（最悪キューに周囲が入る）
    """
    if not grid or not grid[0]:
        return 0

    m, n = len(grid), len(grid[0])
    islands = 0
    dirs = [(1, 0), (-1, 0), (0, 1), (0, -1)]

    for r in range(m):
        for c in range(n):
            if grid[r][c] == "1":
                islands += 1
                # この島をBFSで塗りつぶす
                grid[r][c] = "0"
                q = deque([(r, c)])
                while q:
                    i, j = q.popleft()
                    for di, dj in dirs:
                        ni, nj = i + di, j + dj
                        if 0 <= ni < m and 0 <= nj < n and grid[ni][nj] == "1":
                            grid[ni][nj] = "0"
                            q.append((ni, nj))
    return islands


# テスト
print(
    num_islands(
        [
            ["1", "1", "0", "0", "0"],
            ["1", "1", "0", "0", "0"],
            ["0", "0", "1", "0", "0"],
            ["0", "0", "0", "1", "1"],
        ]
    )
)

print(num_islands([["1", "0", "1", "0"], ["0", "1", "0", "1"], ["1", "0", "1", "0"]]))

print(num_islands([["0", "0", "0"]]))
