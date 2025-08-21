from collections import deque
from typing import List


def orangesRotting(grid: List[List[int]]) -> int:
    m, n = len(grid), len(grid[0])
    q = deque()
    fresh = 0

    # 初期状態の収集：腐った位置をキューへ、新鮮の数を数える
    for r in range(m):
        for c in range(n):
            if grid[r][c] == 2:
                q.append((r, c, 0))  # (行, 列, 経過分)
            elif grid[r][c] == 1:
                fresh += 1

    # 新鮮がないなら0
    if fresh == 0:
        return 0

    minutes = 0
    dirs = [(1, 0), (-1, 0), (0, 1), (0, -1)]

    # 多点同時開始のBFS
    while q:
        r, c, t = q.popleft()
        for dr, dc in dirs:
            nr, nc = r + dr, c + dc
            if 0 <= nr < m and 0 <= nc < n and grid[nr][nc] == 1:
                grid[nr][nc] = 2  # 腐らせる
                fresh -= 1
                q.append((nr, nc, t + 1))
                minutes = max(minutes, t + 1)

    # 全部腐ったか判定
    return minutes if fresh == 0 else -1


# テスト
print(orangesRotting([[2, 1, 1], [1, 1, 0], [0, 1, 1]]))  # 4

print(orangesRotting([[2, 1, 1], [0, 1, 1], [1, 0, 1]]))  # -1

print(orangesRotting([[0, 2]]))  # 0
