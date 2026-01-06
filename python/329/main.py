from typing import List
from collections import deque


def find_task_order(n: int, prerequisites: List[List[int]]) -> List[int]:
    """
    依存関係があるタスクの実行順を1つ返す（なければ []）。
    Kahn法によるトポロジカルソート: O(n + m)
    """
    graph = [[] for _ in range(n)]
    indeg = [0] * n

    # 辺 b -> a を張る（aはbが終わってから）
    for a, b in prerequisites:
        graph[b].append(a)
        indeg[a] += 1

    q = deque([i for i in range(n) if indeg[i] == 0])
    order = []

    while q:
        cur = q.popleft()
        order.append(cur)
        for nxt in graph[cur]:
            indeg[nxt] -= 1
            if indeg[nxt] == 0:
                q.append(nxt)

    return order if len(order) == n else []


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        (4, [[1, 0], [2, 0], [3, 1], [3, 2]]),
        (2, [[1, 0], [0, 1]]),
        (3, []),
    ]

    for i, (n, prereq) in enumerate(cases, start=1):
        print(f"例{i} 入力: n={n}, prerequisites={prereq}")
        print(f"例{i} 出力: {find_task_order(n, prereq)}")
        print("-" * 50)
