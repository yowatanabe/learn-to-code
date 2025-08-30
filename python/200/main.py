from typing import List


def rob(nums: List[int]) -> int:
    # dp[i] = i番目まで見たときの最大金額
    # dp[i] = max(dp[i-1], dp[i-2] + nums[i])
    if not nums:
        return 0
    n = len(nums)
    if n == 1:
        return nums[0]

    prev2 = 0  # dp[i-2]
    prev1 = nums[0]  # dp[i-1]

    for i in range(1, n):
        cur = max(prev1, prev2 + nums[i])
        prev2, prev1 = prev1, cur

    return prev1


# テスト
print(rob([1, 2, 3, 1]))  # 4
print(rob([2, 7, 9, 3, 1]))  # 12
print(rob([2, 1, 1, 2]))  # 4
