from typing import List
from collections import deque

def min_hops(n: int, edges: List[List[int]], start: int, target: int) -> int:
    """
    無向グラフの最短ホップ数を BFS で求める。

    BFS では、始点から距離 1, 2, 3... の順に探索されるため、
    target に最初に到達したときの距離が最短ホップ数になる。

    計算量: O(n + m)
    m = 辺の数
    """
    if start == target:
        return 0

    graph = [[] for _ in range(n)]
    for u, v in edges:
        graph[u].append(v)
        graph[v].append(u)

    visited = [False] * n
    q = deque([(start, 0)])
    visited[start] = True

    while q:
        node, dist = q.popleft()

        for nxt in graph[node]:
            if visited[nxt]:
                continue

            if nxt == target:
                return dist + 1

            visited[nxt] = True
            q.append((nxt, dist + 1))

    return -1


if __name__ == "__main__":
    print(min_hops(
        6,
        [[0, 1], [0, 2], [1, 3], [2, 3], [3, 4], [4, 5]],
        0,
        5
    ))  # 4

    print(min_hops(
        4,
        [[0, 1], [2, 3]],
        0,
        3
    ))  # -1

    print(min_hops(
        5,
        [[0, 1], [1, 2], [2, 3], [3, 4]],
        2,
        2
    ))  # 0
