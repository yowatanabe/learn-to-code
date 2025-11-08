from collections import deque
from typing import List


def find_task_order(n: int, deps: List[List[int]]) -> List[int]:
    """
    n個のタスク(0..n-1)と依存関係deps=[a,b] (aはbに依存)が与えられたとき、
    すべての依存を満たすタスク実行順序を1つ返す。
    不可能な場合（循環あり）は [] を返す。

    アルゴリズム: Kahnのトポロジカルソート (BFS)
      - グラフ: b -> a (bを終えたらaに進める)
      - indeg[x]: xに入る辺の本数（依存している前提タスク数）
      - indegが0のノード群から開始し、キューで幅優先に処理
      - 取り出したノードuから出る辺(u->v)を「削る」ことで indeg[v]--。
        indeg[v]==0になればキューに追加。
      - 処理したノード数がnに満たなければサイクルあり → []。
    """
    # 隣接リスト: pre -> [list of tasks that depend on pre]
    graph = [[] for _ in range(n)]
    indeg = [0] * n

    for a, b in deps:
        # b -> a の向きでエッジを張る (a depends on b)
        graph[b].append(a)
        indeg[a] += 1

    # 入次数0のノードを初期キューに詰める
    q = deque([i for i in range(n) if indeg[i] == 0])

    order: List[int] = []

    while q:
        u = q.popleft()
        order.append(u)
        # uを前提としているタスクの入次数を1減らす
        for v in graph[u]:
            indeg[v] -= 1
            if indeg[v] == 0:
                q.append(v)

    # すべてのノードを取り出せたか確認
    if len(order) != n:
        # どこかにサイクルがあり、一部ノードの入次数が0にならなかった
        return []
    return order


print(find_task_order(4, [[2, 0], [2, 1], [3, 2]]))
print(find_task_order(3, [[1, 0], [2, 1]]))
print(find_task_order(3, [[0, 1], [1, 2], [2, 0]]))
print(find_task_order(2, []))
