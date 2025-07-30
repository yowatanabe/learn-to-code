def subarray_sum(nums, k):
    from collections import defaultdict

    count = 0
    current_sum = 0
    sum_map = defaultdict(int)
    sum_map[0] = 1

    for num in nums:
        current_sum += num
        if current_sum - k in sum_map:
            count += sum_map[current_sum - k]
        sum_map[current_sum] += 1

    return count


# テスト例
print(subarray_sum([1, 2, 3], 3))  # 2
print(subarray_sum([1, 1, 1], 2))  # 2
print(subarray_sum([3, 4, 7, 2, -3, 1, 4, 2], 7))  # 4
