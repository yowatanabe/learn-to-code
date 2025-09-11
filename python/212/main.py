from collections import deque
from typing import List


def max_sliding_window(nums: List[int], k: int) -> List[int]:
    """
    単調減少キュー（値が前から降順）で O(n).
    deque には「インデックス」を保持し、先頭が常にウィンドウ内の最大値の位置。
    """
    dq = deque()  # インデックスを保持: nums[dq[0]] が現在の最大
    ans = []

    for i, x in enumerate(nums):
        # 1) 右端に x を入れる前に、x 以下の要素は後ろから捨てる（降順を保つ）
        while dq and nums[dq[-1]] <= x:
            dq.pop()
        dq.append(i)

        # 2) ウィンドウ左端より左に出たインデックスを先頭から削除
        left = i - k + 1
        if dq[0] < left:
            dq.popleft()

        # 3) k 個目から答えを記録
        if i >= k - 1:
            ans.append(nums[dq[0]])

    return ans


# テスト
print(max_sliding_window([1, 3, -1, -3, 5, 3, 6, 7], 3))  # [3,3,5,5,6,7]
print(max_sliding_window([1], 1))  # [1]
print(max_sliding_window([9, 11], 2))  # [11]
print(max_sliding_window([4, -2], 1))  # [4, -2]
