from typing import List
from collections import deque

def count_reachable_from_zero(n: int, edges: List[List[int]]) -> int:
    """
    有向グラフで、頂点 0 から到達できる頂点数を BFS で数える。

    計算量: O(n + m)
    n = 頂点数
    m = 辺数
    """
    graph = [[] for _ in range(n)]
    for u, v in edges:
        graph[u].append(v)

    visited = [False] * n
    q = deque([0])
    visited[0] = True
    count = 1

    while q:
        node = q.popleft()
        for nxt in graph[node]:
            if not visited[nxt]:
                visited[nxt] = True
                count += 1
                q.append(nxt)

    return count


if __name__ == "__main__":
    print(count_reachable_from_zero(
        6,
        [[0, 1], [0, 2], [1, 3], [3, 4], [2, 4]]
    ))  # 5

    print(count_reachable_from_zero(
        4,
        [[1, 2], [2, 3]]
    ))  # 1

    print(count_reachable_from_zero(
        5,
        [[0, 1], [1, 2], [2, 0], [2, 3], [3, 4]]
    ))  # 5
