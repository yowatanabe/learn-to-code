from typing import List, Tuple
from collections import deque


def update_matrix(mat: List[List[int]]) -> List[List[int]]:
    m, n = len(mat), len(mat[0])
    INF = 10**9
    dist = [[INF] * n for _ in range(m)]
    q = deque()

    # 0 を全てキューへ
    for r in range(m):
        for c in range(n):
            if mat[r][c] == 0:
                dist[r][c] = 0
                q.append((r, c))

    dirs = [(1, 0), (-1, 0), (0, 1), (0, -1)]

    while q:
        r, c = q.popleft()
        for dr, dc in dirs:
            nr, nc = r + dr, c + dc
            if 0 <= nr < m and 0 <= nc < n:
                if dist[nr][nc] > dist[r][c] + 1:
                    dist[nr][nc] = dist[r][c] + 1
                    q.append((nr, nc))

    return dist


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        (
            [
                [0, 0, 0],
                [0, 1, 0],
                [1, 1, 1],
            ],
            [
                [0, 0, 0],
                [0, 1, 0],
                [1, 2, 1],
            ],
        ),
        (
            [
                [0, 1, 1],
                [1, 1, 1],
                [1, 1, 0],
            ],
            [
                [0, 1, 2],
                [1, 2, 1],
                [2, 1, 0],
            ],
        ),
    ]

    for i, (mat, expected) in enumerate(cases, start=1):
        got = update_matrix(mat)
        print(f"例{i} 入力 mat:")
        for row in mat:
            print(row)
        print(f"例{i} 出力 dist:")
        for row in got:
            print(row)
        print(f"例{i} 期待値:")
        for row in expected:
            print(row)
        print("-" * 60)
