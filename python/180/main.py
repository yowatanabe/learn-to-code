def min_subarray_len(target: int, nums: list[int]) -> int:
    left = 0
    current = 0
    ans = float("inf")

    for right, x in enumerate(nums):
        current += x
        # 合計が target 以上になったら、できるだけ左を縮める
        while current >= target:
            ans = min(ans, right - left + 1)
            current -= nums[left]
            left += 1

    return 0 if ans == float("inf") else ans


# テスト
print(min_subarray_len(7, [2, 3, 1, 2, 4, 3]))  # 2
print(min_subarray_len(4, [1, 4, 4]))  # 1
print(min_subarray_len(11, [1, 1, 1, 1, 1, 1, 1, 1]))  # 0
