from typing import List


def min_subarray_len(target: int, nums: List[int]) -> int:
    n = len(nums)
    left = 0
    curr_sum = 0
    ans = float("inf")

    for right in range(n):
        curr_sum += nums[right]

        # 合計が target 以上になったら、できるだけ左を縮める
        while curr_sum >= target:
            ans = min(ans, right - left + 1)
            curr_sum -= nums[left]
            left += 1

    return 0 if ans == float("inf") else ans


# 実行例
print(min_subarray_len(7, [2, 3, 1, 2, 4, 3]))  # 2
print(min_subarray_len(4, [1, 4, 4]))  # 1
print(min_subarray_len(11, [1, 1, 1, 1, 1, 1, 1]))  # 0
