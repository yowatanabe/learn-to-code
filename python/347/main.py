import heapq


class MedianFinder:
    def __init__(self):
        self.low = []  # max-heap (符号反転)
        self.high = []  # min-heap

    def addNum(self, num: int) -> None:
        # まず low に入れる
        heapq.heappush(self.low, -num)

        # low の最大 <= high の最小 を保つために移動
        if self.high and (-self.low[0] > self.high[0]):
            x = -heapq.heappop(self.low)
            heapq.heappush(self.high, x)

        # サイズ調整（差が2以上にならないように）
        if len(self.low) > len(self.high) + 1:
            x = -heapq.heappop(self.low)
            heapq.heappush(self.high, x)
        elif len(self.high) > len(self.low) + 1:
            x = heapq.heappop(self.high)
            heapq.heappush(self.low, -x)

    def findMedian(self) -> float:
        if len(self.low) > len(self.high):
            return float(-self.low[0])
        if len(self.high) > len(self.low):
            return float(self.high[0])
        # 偶数個
        return (-self.low[0] + self.high[0]) / 2.0


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    mf = MedianFinder()

    ops = ["add", "add", "find", "add", "find"]
    vals = [1, 2, None, 3, None]

    for op, v in zip(ops, vals):
        if op == "add":
            mf.addNum(v)
            print(f"add({v})")
        else:
            print(f"median = {mf.findMedian()}")
