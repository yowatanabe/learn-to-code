from typing import List
import heapq

def min_cost_connect_points(points: List[List[int]]) -> int:
    n = len(points)
    if n <= 1:
        return 0

    def manhattan(i: int, j: int) -> int:
        return abs(points[i][0] - points[j][0]) + abs(points[i][1] - points[j][1])

    # Prim's algorithm
    total = 0
    visited = [False] * n
    min_heap = [(0, 0)]  # (cost to add, node)
    added = 0

    while added < n:
        cost, u = heapq.heappop(min_heap)
        if visited[u]:
            continue
        visited[u] = True
        total += cost
        added += 1

        # u から未訪問ノードへ伸ばす候補を追加
        for v in range(n):
            if not visited[v]:
                heapq.heappush(min_heap, (manhattan(u, v), v))

    return total


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        ([[0, 0], [2, 2], [3, 10], [5, 2], [7, 0]], 20),
        ([[3, 12], [-2, 5], [-4, 1]], 18),
        ([[0, 0]], 0),
    ]

    for i, (points, expected) in enumerate(cases, start=1):
        got = min_cost_connect_points(points)
        print(f"例{i} 入力: points={points}")
        print(f"例{i} 出力: {got} (期待値: {expected})")
        print("-" * 60)
