import sys
from typing import List

sys.setrecursionlimit(10**7)


def has_dependency_cycle(n: int, deps: List[List[int]]) -> bool:
    """
    n個のサービス(0..n-1)と依存関係depsが与えられたとき、
    依存グラフにサイクルが存在するならTrue、なければFalseを返す。

    アルゴリズム:
      - グラフを隣接リストで構築: a -> b (a depends on b)
      - 各ノードに3状態を持つ:
          0 = 未訪問
          1 = 現在のDFSスタック上(探索中)
          2 = 完全に探索済み(閉じた)
      - DFS中に、状態1のノードに再び到達したらサイクル。

    時間計算量: O(n + |deps|)
    追加メモリ: O(n + |deps|)
    """
    # 隣接リスト
    g = [[] for _ in range(n)]
    for a, b in deps:
        g[a].append(b)

    state = [0] * n  # 0=unvisited, 1=visiting, 2=done

    def dfs(u: int) -> bool:
        # True を返したら「サイクルあり」を意味する
        if state[u] == 1:
            # 今の探索経路にすでにいる -> サイクル
            return True
        if state[u] == 2:
            # もう完全処理済みならここからはサイクルは生えない
            return False

        state[u] = 1  # 探索中にする
        for v in g[u]:
            if dfs(v):
                return True
        state[u] = 2  # 完了
        return False

    for node in range(n):
        if state[node] == 0:
            if dfs(node):
                return True
    return False


print(has_dependency_cycle(4, [[0, 1], [1, 2], [2, 3]]))
print(has_dependency_cycle(3, [[0, 1], [1, 2], [2, 0]]))
print(has_dependency_cycle(2, []))
print(has_dependency_cycle(1, [[0, 0]]))
print(has_dependency_cycle(0, []))
