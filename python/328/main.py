from typing import List, Dict, Tuple
import heapq


def network_delay_time(times: List[List[int]], n: int, k: int) -> int:
    # 隣接リスト: u -> (v, w)
    graph: Dict[int, List[Tuple[int, int]]] = {i: [] for i in range(1, n + 1)}
    for u, v, w in times:
        graph[u].append((v, w))

    INF = 10**18
    dist = [INF] * (n + 1)
    dist[k] = 0

    pq = [(0, k)]  # (距離, ノード)

    while pq:
        d, node = heapq.heappop(pq)
        if d != dist[node]:
            continue

        for nxt, w in graph[node]:
            nd = d + w
            if nd < dist[nxt]:
                dist[nxt] = nd
                heapq.heappush(pq, (nd, nxt))

    ans = max(dist[1:])  # dist[0] は使わない
    return -1 if ans >= INF else ans


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        ([[2, 1, 1], [2, 3, 1], [3, 4, 1]], 4, 2, 2),
        ([[1, 2, 1]], 2, 2, -1),
        ([[1, 2, 1], [2, 3, 2], [1, 3, 4]], 3, 1, 3),
    ]

    for i, (times, n, k, expected) in enumerate(cases, start=1):
        got = network_delay_time(times, n, k)
        print(f"例{i} 入力: times={times}, n={n}, k={k}")
        print(f"例{i} 出力: {got} (期待値: {expected})")
        print("-" * 50)
