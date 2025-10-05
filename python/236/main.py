from typing import List


def min_subarray_len(target: int, nums: List[int]) -> int:
    """
    2ポインタ（スライディングウィンドウ）で O(n).
    すべて正の整数なので、左端を縮めると総和は必ず小さくなる単調性が成り立つ。
    """
    n = len(nums)
    left = 0
    cur_sum = 0
    ans = n + 1  # 不可能の印

    for right in range(n):
        cur_sum += nums[right]
        # 可能な限り左を縮めて最短化
        while cur_sum >= target:
            ans = min(ans, right - left + 1)
            cur_sum -= nums[left]
            left += 1

    return 0 if ans == n + 1 else ans


# テスト
print(min_subarray_len(7, [2, 3, 1, 2, 4, 3]))  # 2
print(min_subarray_len(4, [1, 4, 4]))  # 1
print(min_subarray_len(11, [1, 1, 1, 1, 1, 1, 1]))  # 0
