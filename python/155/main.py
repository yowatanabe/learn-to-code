def max_median_of_odd_subarrays(nums):
    n = len(nums)
    max_median = float("-inf")

    for length in range(1, n + 1, 2):  # 奇数長の部分配列のみ
        for i in range(n - length + 1):
            sub = nums[i : i + length]
            median = sorted(sub)[length // 2]
            max_median = max(max_median, median)

    return max_median


# 実行例
print(max_median_of_odd_subarrays([1, 3, 2, 7, 4, 6]))  # 出力: 6
