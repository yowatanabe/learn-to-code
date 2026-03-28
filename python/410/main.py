from typing import List
from collections import deque

def nearest_zero_distance(grid: List[List[int]]) -> List[List[int]]:
    """
    複数始点 BFS を使う典型問題。

    すべての 0 を同時にスタート地点としてキューに入れ、
    そこから BFS で距離を広げていく。
    すると各 1 について、最初に到達した距離が
    最も近い 0 までの最短距離になる。

    計算量: O(m * n)
    """
    m, n = len(grid), len(grid[0])
    dist = [[-1] * n for _ in range(m)]
    q = deque()

    # すべての 0 を BFS の開始点にする
    for r in range(m):
        for c in range(n):
            if grid[r][c] == 0:
                dist[r][c] = 0
                q.append((r, c))

    directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]

    while q:
        r, c = q.popleft()

        for dr, dc in directions:
            nr, nc = r + dr, c + dc
            if 0 <= nr < m and 0 <= nc < n and dist[nr][nc] == -1:
                dist[nr][nc] = dist[r][c] + 1
                q.append((nr, nc))

    return dist


if __name__ == "__main__":
    print(nearest_zero_distance([[0, 0, 0], [0, 1, 0], [0, 0, 0]]))
    # [[0, 0, 0], [0, 1, 0], [0, 0, 0]]

    print(nearest_zero_distance([[0, 0, 0], [0, 1, 0], [1, 1, 1]]))
    # [[0, 0, 0], [0, 1, 0], [1, 2, 1]]

    print(nearest_zero_distance([[1, 1, 1], [1, 0, 1], [1, 1, 1]]))
    # [[2, 1, 2], [1, 0, 1], [2, 1, 2]]
