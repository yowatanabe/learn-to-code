def max_len_zero_sum_subarray(nums):
    sum_indices = {0: -1}
    max_len = 0
    total = 0
    for i, num in enumerate(nums):
        total += num
        if total in sum_indices:
            max_len = max(max_len, i - sum_indices[total])
        else:
            sum_indices[total] = i
    return max_len


# テスト例
print(max_len_zero_sum_subarray([1, -1, 5, -2, 3]))  # 2
print(max_len_zero_sum_subarray([3, 4, -7, 1, 3, 3, 1, -4]))  # 4
print(max_len_zero_sum_subarray([1, 2, 3]))  # 0
