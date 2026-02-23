from typing import List
from collections import deque

def min_deploy_time(n: int, time: List[int], deps: List[List[int]]) -> int:
    """
    DAG なら「各ノードの最早完了時刻」をDPで求める。
    並列実行可能なので、最短完了時間 = max(各サービスの最早完了時刻)。

    - トポロジカルソート(Kahn)で順に処理
    - dp_end[v] = v が完了する最短時刻
      dp_end[v] = time[v] + max(dp_end[u]) (u -> v の全 u)
    - サイクルがあれば -1
    """

    graph = [[] for _ in range(n)]
    indeg = [0] * n

    for a, b in deps:
        graph[a].append(b)
        indeg[b] += 1

    # 初期: 依存なしは開始時刻0なので完了時刻=time[i]
    dp_end = time[:]  # copy

    q = deque([i for i in range(n) if indeg[i] == 0])
    processed = 0

    while q:
        u = q.popleft()
        processed += 1

        for v in graph[u]:
            # u の完了後に v を始められるので、v の完了時刻候補を更新
            # vの完了 = v自身の時間 + (前提の最大完了時刻)
            dp_end[v] = max(dp_end[v], dp_end[u] + time[v])

            indeg[v] -= 1
            if indeg[v] == 0:
                q.append(v)

    if processed != n:
        return -1  # cycle

    return max(dp_end) if n > 0 else 0


if __name__ == "__main__":
    print(min_deploy_time(
        4,
        [3, 2, 5, 4],
        [[0, 2], [1, 2], [2, 3]]
    ))  # 12

    print(min_deploy_time(
        3,
        [2, 2, 2],
        [[0, 1], [1, 2], [2, 0]]
    ))  # -1
