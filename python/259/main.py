from typing import List


class FenwickTree:
    """
    Fenwick Tree (Binary Indexed Tree)
    - 1-indexed 内部表現
    - add(i, x): A[i] += x
    - sum(i): A[0] + ... + A[i] を返す (iは0-indexで渡す想定)
    """

    def __init__(self, n: int):
        # fenw[0] は使わない。長さ n+1 にする
        self.n = n
        self.fenw = [0] * (n + 1)

    def _lsb(self, i: int) -> int:
        # 最下位ビットを返す (i & -i)
        return i & -i

    def add(self, idx: int, delta: int) -> None:
        """
        A[idx] += delta を反映する
        0-indexの idx を Fenwick 内部の 1-index にして更新
        """
        i = idx + 1
        while i <= self.n:
            self.fenw[i] += delta
            i += self._lsb(i)

    def prefix_sum(self, idx: int) -> int:
        """
        A[0] + A[1] + ... + A[idx] を返す
        0-indexの idx を 1-index に直して累積
        """
        s = 0
        i = idx + 1
        while i > 0:
            s += self.fenw[i]
            i -= self._lsb(i)
        return s

    def range_sum(self, left: int, right: int) -> int:
        """
        A[left] + ... + A[right]
        """
        if left == 0:
            return self.prefix_sum(right)
        return self.prefix_sum(right) - self.prefix_sum(left - 1)


class AlertCounter:
    """
    アラート回数の区間クエリと更新を扱うラッパ。
    FenwickTree を内部に持ち、
    - add(i, x)
    - range_sum(l, r)
    を O(log n) で提供する。
    """

    def __init__(self, alerts: List[int]):
        self.n = len(alerts)
        self.ft = FenwickTree(self.n)
        # 初期値をFenwick Treeに流し込む
        for i, val in enumerate(alerts):
            self.ft.add(i, val)

    def add(self, i: int, x: int) -> None:
        self.ft.add(i, x)

    def range_sum(self, l: int, r: int) -> int:
        return self.ft.range_sum(l, r)


# 簡単なテスト (問題文の例と同じシナリオ)
if __name__ == "__main__":
    alerts = [2, 1, 0, 4, 3]
    c = AlertCounter(alerts)

    out = []
    out.append(c.range_sum(0, 2))  # -> 3
    c.add(2, 5)  # alerts becomes [2,1,5,4,3]
    out.append(c.range_sum(0, 2))  # -> 8
    out.append(c.range_sum(1, 4))  # -> 13
    c.add(4, 7)  # alerts becomes [2,1,5,4,10]
    out.append(c.range_sum(3, 4))  # -> 14

    print(out)
    # 期待: [3, 8, 13, 14]
