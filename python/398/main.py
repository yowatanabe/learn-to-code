from typing import List
import heapq

def min_path_cost(grid: List[List[int]]) -> int:
    """
    各マスを頂点とみなし、上下左右移動を辺とする最短経路問題。
    コストが非負なので Dijkstra で解ける。

    dist[r][c] = (0,0) から (r,c) までの最小コスト
    開始マスのコストも含むので、初期値は grid[0][0]

    計算量: O(m * n * log(m * n))
    """
    m, n = len(grid), len(grid[0])
    INF = 10**30

    dist = [[INF] * n for _ in range(m)]
    dist[0][0] = grid[0][0]

    pq = [(grid[0][0], 0, 0)]  # (cost, r, c)
    directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]

    while pq:
        cost, r, c = heapq.heappop(pq)

        if cost != dist[r][c]:
            continue

        if r == m - 1 and c == n - 1:
            return cost

        for dr, dc in directions:
            nr, nc = r + dr, c + dc
            if 0 <= nr < m and 0 <= nc < n:
                new_cost = cost + grid[nr][nc]
                if new_cost < dist[nr][nc]:
                    dist[nr][nc] = new_cost
                    heapq.heappush(pq, (new_cost, nr, nc))

    return dist[m - 1][n - 1]


if __name__ == "__main__":
    print(min_path_cost([[1, 3, 1], [1, 5, 1], [4, 2, 1]]))  # 7
    print(min_path_cost([[5]]))                              # 5
    print(min_path_cost([[1, 2, 3], [4, 5, 6]]))             # 12
