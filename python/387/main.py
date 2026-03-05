from typing import List, Tuple

def min_edges_to_force_order(n: int, edges: List[List[int]], order: List[int]) -> int:
    """
    まず既存辺が order と矛盾していないかチェック:
      order上で a が b より後なのに a->b があるなら不可能 (-1)

    その後、order をトポロジカル順序として「必ず」成立させるための最小追加辺は、
    order を一本の鎖にするのが最小:
      order[i] -> order[i+1] を (i=0..n-2) で追加すれば必ず order が成立する

    ただし、その鎖の辺のうち既に存在するものは追加不要。

    よって:
      必要追加数 = (n-1) - (order[i] -> order[i+1]) が既存にある本数

    計算量: O(n + m)
    """

    pos = [0] * n
    for i, v in enumerate(order):
        pos[v] = i

    # 既存辺が order に反していないか
    for a, b in edges:
        if pos[a] > pos[b]:
            return -1

    # 既存辺集合（隣接だけ確認できればよい）
    existing = set((a, b) for a, b in edges)

    need = 0
    for i in range(n - 1):
        a = order[i]
        b = order[i + 1]
        if (a, b) not in existing:
            need += 1
    return need


if __name__ == "__main__":
    print(min_edges_to_force_order(4, [[0,2], [1,2]], [0,1,2,3]))      # 0
    print(min_edges_to_force_order(3, [[2,0]], [0,1,2]))               # -1
    print(min_edges_to_force_order(4, [[0,2], [2,3]], [0,2,1,3]))      # 2
