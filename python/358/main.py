from typing import List
from collections import deque

def can_finish(n: int, prerequisites: List[List[int]]) -> bool:
    graph = [[] for _ in range(n)]
    indeg = [0] * n

    for a, b in prerequisites:
        graph[b].append(a)  # b -> a
        indeg[a] += 1

    q = deque([i for i in range(n) if indeg[i] == 0])
    done = 0

    while q:
        v = q.popleft()
        done += 1
        for nxt in graph[v]:
            indeg[nxt] -= 1
            if indeg[nxt] == 0:
                q.append(nxt)

    return done == n


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        (2, [[1, 0]], True),
        (2, [[1, 0], [0, 1]], False),
        (4, [[1, 0], [2, 0], [3, 1], [3, 2]], True),
    ]

    for i, (n, prereq, expected) in enumerate(cases, start=1):
        got = can_finish(n, prereq)
        print(f"例{i} 入力: n={n}, prerequisites={prereq}")
        print(f"例{i} 出力: {got} (期待値: {expected})")
        print("-" * 60)
