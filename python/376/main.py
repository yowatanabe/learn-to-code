from typing import List, Dict
from collections import Counter

class DSU:
    def __init__(self):
        self.parent: Dict[str, str] = {}
        self.size: Dict[str, int] = {}

    def _add(self, x: str) -> None:
        if x not in self.parent:
            self.parent[x] = x
            self.size[x] = 1

    def find(self, x: str) -> str:
        self._add(x)
        # path compression
        while self.parent[x] != x:
            self.parent[x] = self.parent[self.parent[x]]
            x = self.parent[x]
        return x

    def union(self, a: str, b: str) -> None:
        ra, rb = self.find(a), self.find(b)
        if ra == rb:
            return
        # union by size
        if self.size[ra] < self.size[rb]:
            ra, rb = rb, ra
        self.parent[rb] = ra
        self.size[ra] += self.size[rb]

def min_replacements_to_unify(ids: List[str], pairs: List[List[str]]) -> int:
    """
    すべての要素を同じ文字列にできるか？
    - 全要素が同一グループ（DSUの同一root）に属する必要がある
    できるなら、最小置換回数 = n - (最頻出のID回数) ではなく、
    「同一グループ内のどのIDに統一するか」なので
    n - (ids内で最も多く出るIDの出現回数) が最小。
    ※全IDが同一グループに属する場合のみ成立。
    """
    n = len(ids)
    if n == 0:
        return 0

    dsu = DSU()
    # union関係を構築
    for a, b in pairs:
        dsu.union(a, b)

    # ids に現れるものが同一グループかチェック
    roots = {dsu.find(x) for x in ids}
    if len(roots) != 1:
        return -1

    # 同一グループなら、ids内で最頻出のIDに合わせるのが最小置換
    freq = Counter(ids)
    keep = max(freq.values())
    return n - keep

if __name__ == "__main__":
    print(min_replacements_to_unify(
        ["a1", "b1", "c1", "a1"],
        [["a1", "b1"], ["b1", "c1"]]
    ))  # 2

    print(min_replacements_to_unify(
        ["x", "y", "y"],
        []
    ))  # -1

    print(min_replacements_to_unify(
        ["svc-A", "svc_B", "svc-A", "svc_B"],
        [["svc-A", "svc_B"]]
    ))  # 2
