import heapq


class MedianTracker:
    def __init__(self):
        self.small = []  # 小さい半分。最大ヒープとして使うためマイナスで入れる
        self.large = []  # 大きい半分。最小ヒープ

    def add(self, value):
        # まず small に入れる
        heapq.heappush(self.small, -value)

        # small の最大値が large の最小値以下になるように調整
        if self.large and -self.small[0] > self.large[0]:
            moved = -heapq.heappop(self.small)
            heapq.heappush(self.large, moved)

        # サイズ差を調整
        if len(self.small) > len(self.large) + 1:
            moved = -heapq.heappop(self.small)
            heapq.heappush(self.large, moved)

        if len(self.large) > len(self.small):
            moved = heapq.heappop(self.large)
            heapq.heappush(self.small, -moved)

    def median(self):
        if len(self.small) > len(self.large):
            return -self.small[0]

        return (-self.small[0] + self.large[0]) / 2


# 実行例
tracker = MedianTracker()

tracker.add(10)
print(tracker.median())  # 10

tracker.add(20)
print(tracker.median())  # 15.0

tracker.add(5)
print(tracker.median())  # 10

tracker.add(30)
print(tracker.median())  # 15.0
