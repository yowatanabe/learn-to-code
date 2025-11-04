from typing import List


class UnionFind:
    def __init__(self, n: int) -> None:
        self.parent = list(range(n))
        self.size = [1] * n
        self.components = n  # 連結成分の数

    def find(self, x: int) -> int:
        # 経路圧縮
        if self.parent[x] != x:
            self.parent[x] = self.find(self.parent[x])
        return self.parent[x]

    def union(self, a: int, b: int) -> bool:
        """
        a と b の属する集合をマージする。
        もともと同じ集合なら False、
        新しくマージされたなら True を返す。
        """
        ra = self.find(a)
        rb = self.find(b)
        if ra == rb:
            return False

        # union by size（大きい方に小さい方をぶら下げる）
        if self.size[ra] < self.size[rb]:
            ra, rb = rb, ra
        self.parent[rb] = ra
        self.size[ra] += self.size[rb]
        self.components -= 1
        return True


def earliest_full_connection(n: int, logs: List[List[int]]) -> int:
    """
    n台のサーバと接続ログlogsから、全サーバが1つの連結成分になる
    最初の時刻を返す。ならなければ -1。
    """
    # サーバ1台なら最初から「全接続」とみなす
    if n <= 1:
        return 0

    # time昇順でソート
    logs.sort(key=lambda x: x[0])

    uf = UnionFind(n)

    for time, a, b in logs:
        merged = uf.union(a, b)
        if merged and uf.components == 1:
            return time

    return -1


print(earliest_full_connection(n=4, logs=[[1, 0, 1], [3, 1, 2], [4, 2, 3]]))
print(earliest_full_connection(n=4, logs=[[5, 0, 1], [2, 2, 3], [4, 1, 2]]))
print(earliest_full_connection(n=3, logs=[[1, 0, 1]]))
print(earliest_full_connection(n=1, logs=[[]]))
