from collections import defaultdict, deque
from typing import List


def find_order(numCourses: int, prerequisites: List[List[int]]) -> List[int]:
    # b -> a の有向辺（bを終えるとaへ進める）
    graph = defaultdict(list)
    indeg = [0] * numCourses

    for a, b in prerequisites:
        if a == b:  # 自己ループは即不可能
            return []
        graph[b].append(a)
        indeg[a] += 1

    # 入次数0（今すぐ取れる）をキューへ
    q = deque(i for i in range(numCourses) if indeg[i] == 0)
    order = []

    while q:
        u = q.popleft()
        order.append(u)
        for v in graph[u]:
            indeg[v] -= 1
            if indeg[v] == 0:
                q.append(v)

    # すべて取り切れたら順序完成（取り切れない = 循環）
    return order if len(order) == numCourses else []


# テスト
print(find_order(4, [[1, 0], [2, 0], [3, 1], [3, 2]]))  # 例: [0,1,2,3]
print(find_order(2, [[1, 0]]))  # [0,1]
print(find_order(2, [[1, 0], [0, 1]]))  # []
