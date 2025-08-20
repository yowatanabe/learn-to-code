from collections import defaultdict, deque
from typing import List


def can_finish(numCourses: int, prerequisites: List[List[int]]) -> bool:
    # グラフ: b -> a（b を終えると a に進める）
    graph = defaultdict(list)
    indeg = [0] * numCourses

    for a, b in prerequisites:
        graph[b].append(a)
        indeg[a] += 1

    # 入次数0（今すぐ取れるコース）をキューへ
    q = deque(i for i in range(numCourses) if indeg[i] == 0)
    taken = 0

    while q:
        cur = q.popleft()
        taken += 1
        for nxt in graph[cur]:
            indeg[nxt] -= 1
            if indeg[nxt] == 0:
                q.append(nxt)

    # すべて取り切れたら循環なし
    return taken == numCourses


# テスト
print(can_finish(2, [[1, 0]]))  # True
print(can_finish(2, [[1, 0], [0, 1]]))  # False
print(can_finish(4, [[1, 0], [2, 1], [3, 2]]))  # True
print(can_finish(3, [[0, 1], [0, 2], [1, 2]]))  # True
