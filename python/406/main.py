from typing import List
from collections import deque

def count_incident_clusters(grid: List[List[str]]) -> int:
    """
    BFS で "1" の連結成分数を数える。

    まだ訪問していない "1" を見つけたら、
    そこから上下左右にたどれる "1" をすべて訪問済みにする。
    この BFS 1 回が 1 クラスタに対応する。

    計算量: O(m * n)
    """
    if not grid or not grid[0]:
        return 0

    rows, cols = len(grid), len(grid[0])
    visited = [[False] * cols for _ in range(rows)]
    clusters = 0
    directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]

    def bfs(sr: int, sc: int) -> None:
        queue = deque([(sr, sc)])
        visited[sr][sc] = True

        while queue:
            r, c = queue.popleft()

            for dr, dc in directions:
                nr, nc = r + dr, c + dc
                if (
                    0 <= nr < rows
                    and 0 <= nc < cols
                    and not visited[nr][nc]
                    and grid[nr][nc] == "1"
                ):
                    visited[nr][nc] = True
                    queue.append((nr, nc))

    for r in range(rows):
        for c in range(cols):
            if grid[r][c] == "1" and not visited[r][c]:
                clusters += 1
                bfs(r, c)

    return clusters


if __name__ == "__main__":
    print(count_incident_clusters([
        ["1", "1", "0", "0", "0"],
        ["1", "1", "0", "0", "0"],
        ["0", "0", "1", "0", "0"],
        ["0", "0", "0", "1", "1"]
    ]))  # 3

    print(count_incident_clusters([
        ["1", "1", "1"],
        ["0", "1", "0"],
        ["1", "1", "1"]
    ]))  # 1

    print(count_incident_clusters([
        ["0", "0", "0"],
        ["0", "0", "0"]
    ]))  # 0
