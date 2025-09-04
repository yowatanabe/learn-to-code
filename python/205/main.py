import heapq
from collections import defaultdict
from typing import List


def network_delay_time(times: List[List[int]], n: int, k: int) -> int:
    # 隣接リスト: u -> [(v, w), ...]
    graph = defaultdict(list)
    for u, v, w in times:
        graph[u].append((v, w))

    INF = 10**19
    dist = [INF] * (n + 1)
    dist[k] = 0

    # Dijkstra: (距離, ノード)
    pq = [(0, k)]
    while pq:
        d, u = heapq.heappop(pq)
        if d > dist[u]:
            continue
        for v, w in graph[u]:
            nd = d + w
            if nd < dist[v]:
                dist[v] = nd
                heapq.heappush(pq, (nd, v))

    ans = max(dist[1:])  # ノードは1..n
    return -1 if ans == INF else ans


# テスト
print(network_delay_time([[2, 1, 1], [2, 3, 1], [3, 4, 1]], 4, 2))  # 2
print(network_delay_time([[1, 2, 1]], 2, 1))  # 1
print(network_delay_time([[1, 2, 1]], 2, 2))  # -1
