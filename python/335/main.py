from typing import List, Tuple
import heapq


def min_cost_path(grid: List[List[int]]) -> int:
    m, n = len(grid), len(grid[0])
    INF = 10**18

    dist = [[INF] * n for _ in range(m)]
    dist[0][0] = grid[0][0]

    pq: List[Tuple[int, int, int]] = [(grid[0][0], 0, 0)]  # (cost, r, c)
    dirs = [(1, 0), (-1, 0), (0, 1), (0, -1)]

    while pq:
        cost, r, c = heapq.heappop(pq)
        if cost != dist[r][c]:
            continue
        if r == m - 1 and c == n - 1:
            return cost

        for dr, dc in dirs:
            nr, nc = r + dr, c + dc
            if 0 <= nr < m and 0 <= nc < n:
                ncost = cost + grid[nr][nc]
                if ncost < dist[nr][nc]:
                    dist[nr][nc] = ncost
                    heapq.heappush(pq, (ncost, nr, nc))

    return dist[m - 1][n - 1]


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        (
            [
                [1, 3, 1],
                [1, 5, 1],
                [4, 2, 1],
            ],
            7,
        ),
        (
            [
                [0, 2, 2],
                [1, 3, 1],
                [4, 2, 0],
            ],
            5,
        ),
        (
            [
                [5],
            ],
            5,
        ),
    ]

    for i, (grid, expected) in enumerate(cases, start=1):
        got = min_cost_path(grid)
        print(f"例{i} 入力 grid:")
        for row in grid:
            print(row)
        print(f"例{i} 出力: {got} (期待値: {expected})")
        print("-" * 50)
