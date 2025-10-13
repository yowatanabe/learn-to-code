from collections import deque
from typing import List


def longest_stable_period(latencies: List[int], T: int) -> int:
    """
    連続区間の max - min <= T を満たす最長長さを O(n) で求める。

    アルゴリズム:
      - 左端 l を固定しつつ右端 r を 0..n-1 で伸ばすスライディングウィンドウ。
      - その窓内の最大値/最小値を O(1) で更新するため、単調デックを2本使う:
          * maxdq: 値が降順（先頭が最大）
          * mindq: 値が昇順（先頭が最小）
      - 各 r 追加時に単調性を壊す末尾を削除し、値とインデックスを末尾に入れる。
      - 条件 (maxdq[0].val - mindq[0].val > T) を満たさなくなったら、
        l を進め、出ていくインデックスをデック先頭から外す。
      - 毎回ウィンドウ長 (r - l + 1) の最大を更新。
    """
    n = len(latencies)
    if n == 0:
        return 0

    # (value, index) を保持
    maxdq: deque[tuple[int, int]] = deque()
    mindq: deque[tuple[int, int]] = deque()

    l = 0
    ans = 0
    for r, x in enumerate(latencies):
        # 最大用: 降順を保つ（小さい末尾を捨てる）
        while maxdq and maxdq[-1][0] < x:
            maxdq.pop()
        maxdq.append((x, r))

        # 最小用: 昇順を保つ（大きい末尾を捨てる）
        while mindq and mindq[-1][0] > x:
            mindq.pop()
        mindq.append((x, r))

        # 条件を満たすまで左端を縮める
        while maxdq[0][0] - mindq[0][0] > T:
            # l を進める前に、ウィンドウ外になった先頭を掃除
            if maxdq[0][1] == l:
                maxdq.popleft()
            if mindq[0][1] == l:
                mindq.popleft()
            l += 1

        ans = max(ans, r - l + 1)

    return ans


print(longest_stable_period([100, 101, 102, 110, 111, 112], 2))  # 3
print(longest_stable_period([5, 5, 5], 3))  # 3
print(longest_stable_period([8, 2, 4, 7], 4))  # 2
print(longest_stable_period([], 10))  # 0
