def findMaxAverage(nums, k):
    window_sum = sum(nums[:k])
    max_sum = window_sum

    for i in range(k, len(nums)):
        window_sum = window_sum - nums[i - k] + nums[i]
        max_sum = max(max_sum, window_sum)

    return max_sum / k


# 実行例
print(findMaxAverage([1, 12, -5, -6, 50, 3], 4))  # 12.75
print(findMaxAverage([5], 1))  # 5.0
print(findMaxAverage([0, 4, 0, 3, 2], 1))  # 4.0
