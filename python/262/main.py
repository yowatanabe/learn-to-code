from collections import deque
from typing import List


def longest_stable_window(nums: List[int], limit: int) -> int:
    """
    連続区間内の (max - min) <= limit を満たす最長長を O(n) で返す。
    max用・min用の単調デックを併用するスライディングウィンドウ。
    """
    if not nums:
        return 0

    maxdq = deque()  # 値が降順になるようインデックスを保持（先頭が最大）
    mindq = deque()  # 値が昇順になるようインデックスを保持（先頭が最小）

    best = 0
    l = 0
    for r, x in enumerate(nums):
        # maxdq: 末尾から x より小さい値を捨てる（降順を維持）
        while maxdq and nums[maxdq[-1]] < x:
            maxdq.pop()
        maxdq.append(r)

        # mindq: 末尾から x より大きい値を捨てる（昇順を維持）
        while mindq and nums[mindq[-1]] > x:
            mindq.pop()
        mindq.append(r)

        # 条件違反なら左端を縮める
        while nums[maxdq[0]] - nums[mindq[0]] > limit:
            # 左端 l を1つ進める。出ていくインデックスを両デックから除外
            if maxdq[0] == l:
                maxdq.popleft()
            if mindq[0] == l:
                mindq.popleft()
            l += 1

        # 現在の有効窓 [l..r] の長さで更新
        best = max(best, r - l + 1)

    return best


print(longest_stable_window([8, 2, 4, 7], 4))
print(longest_stable_window([10, 1, 2, 4, 7, 2], 5))
print(longest_stable_window([], 3))
print(longest_stable_window([3, 3, 3], 0))
