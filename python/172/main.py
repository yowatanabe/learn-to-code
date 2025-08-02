def two_sum_indices(nums, target):
    res = []
    n = len(nums)
    for i in range(n):
        for j in range(i + 1, n):
            if nums[i] + nums[j] == target:
                res.append([i, j])
    return res


# テスト例
print(two_sum_indices([2, 7, 11, 15], 9))  # [[0,1]]
print(two_sum_indices([1, 2, 3, 4, 3], 6))  # [[1,3], [2,4]]
print(two_sum_indices([3, 3, 3], 6))  # [[0,1], [0,2], [1,2]]
