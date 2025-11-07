import heapq
import math
from typing import List


def network_delay_time(n: int, links: List[List[int]], source: int) -> int:
    """
    n台のサーバ(0..n-1), 有向リンクlinks = [u, v, w], 開始ノードsourceから
    全サーバにアラートが届くまでに必要な最短時間の最大値を返す。
    到達できないノードがある場合は -1 を返す。

    アルゴリズム: Dijkstra (優先度付きキュー)
      - 隣接リストでグラフを構築
      - dist[u]: sourceからuへの最短距離 (初期は∞, sourceのみ0)
      - ヒープに (距離, ノード) を詰めて最短距離を更新
    時間計算量: O(m log n)
    """
    # 隣接リスト構築
    graph = [[] for _ in range(n)]
    for u, v, w in links:
        graph[u].append((v, w))

    # 最短距離配列
    dist = [math.inf] * n
    dist[source] = 0

    # (距離, ノード) のタプルを優先度付きキューに入れる
    pq = [(0, source)]

    while pq:
        d, u = heapq.heappop(pq)
        # 既により短い距離が確定しているならスキップ
        if d > dist[u]:
            continue
        # 隣接ノードを緩和
        for v, w in graph[u]:
            nd = d + w
            if nd < dist[v]:
                dist[v] = nd
                heapq.heappush(pq, (nd, v))

    # 到達不能なノードがあれば -1
    if any(d == math.inf for d in dist):
        return -1

    # 最長距離が「全員に届くまでの時間」
    return max(dist)


print(network_delay_time(4, [[0, 1, 1], [0, 2, 4], [1, 2, 2], [2, 3, 1]], 0))

print(network_delay_time(3, [[0, 1, 5], [1, 2, 5]], 0))

print(network_delay_time(3, [[0, 1, 2]], 0))

print(network_delay_time(1, [], 0))
