from typing import List
from collections import deque

def longest_good_subarray(a: List[int], k: int) -> int:
    """
    max-min <= k を満たす最長区間。
    単調キューで window の最小/最大を O(1) で管理しつつ two pointers。

    計算量: O(n)
    """
    minq = deque()  # 値が昇順になるように保つ（先頭が最小）
    maxq = deque()  # 値が降順になるように保つ（先頭が最大）

    left = 0
    best = 0

    for right, x in enumerate(a):
        while minq and minq[-1] > x:
            minq.pop()
        minq.append(x)

        while maxq and maxq[-1] < x:
            maxq.pop()
        maxq.append(x)

        while maxq[0] - minq[0] > k:
            # left を進める。キュー先頭が抜ける値なら取り除く
            if a[left] == minq[0]:
                minq.popleft()
            if a[left] == maxq[0]:
                maxq.popleft()
            left += 1

        best = max(best, right - left + 1)

    return best

if __name__ == "__main__":
    print(longest_good_subarray([8, 2, 4, 7], 4))                # 2
    print(longest_good_subarray([10, 1, 2, 4, 7, 2], 5))         # 4
    print(longest_good_subarray([4, 2, 2, 2, 4, 4, 2, 2], 0))    # 3
