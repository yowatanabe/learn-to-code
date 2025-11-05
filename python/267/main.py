from collections import deque
from typing import List


def count_failure_zones(grid: List[List[str]]) -> int:
    """
    '1' を障害セル、'0' を正常セルとする m×n グリッドに対し、
    上下左右につながる '1' の連結成分数（障害ゾーン数）を O(mn) で返す。
    BFS 実装。
    """
    if not grid or not grid[0]:
        return 0

    m, n = len(grid), len(grid[0])
    visited = [[False] * n for _ in range(m)]

    def bfs(sr: int, sc: int) -> None:
        """(sr,sc) を起点に同じゾーンすべてを訪問する BFS"""
        q = deque()
        q.append((sr, sc))
        visited[sr][sc] = True

        # 上下左右
        dirs = [(1, 0), (-1, 0), (0, 1), (0, -1)]

        while q:
            r, c = q.popleft()
            for dr, dc in dirs:
                nr, nc = r + dr, c + dc
                if 0 <= nr < m and 0 <= nc < n:
                    if not visited[nr][nc] and grid[nr][nc] == "1":
                        visited[nr][nc] = True
                        q.append((nr, nc))

    zones = 0
    for r in range(m):
        for c in range(n):
            if grid[r][c] == "1" and not visited[r][c]:
                # 新しいゾーンを発見
                zones += 1
                bfs(r, c)

    return zones


print(
    count_failure_zones(
        [
            ["1", "1", "0", "0", "0"],
            ["1", "1", "0", "0", "0"],
            ["0", "0", "1", "0", "0"],
            ["0", "0", "0", "1", "1"],
        ]
    )
)

print(count_failure_zones([["1", "1", "1"], ["0", "1", "0"], ["1", "1", "1"]]))

print(count_failure_zones([["0", "0", "0"], ["0", "0", "0"]]))

print(count_failure_zones([["1"]]))
