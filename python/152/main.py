def max_len_zero_sum_subarray(nums):
    prefix_sum = 0
    seen = {0: -1}
    max_len = 0

    for i, num in enumerate(nums):
        prefix_sum += num
        if prefix_sum in seen:
            max_len = max(max_len, i - seen[prefix_sum])
        else:
            seen[prefix_sum] = i

    return max_len


# テスト
print(max_len_zero_sum_subarray([1, -1, 5, -2, 3]))  # 出力: 4
print(max_len_zero_sum_subarray([-2, 1, 1, -1, 2]))  # 出力: 4
print(max_len_zero_sum_subarray([1, 2, 3]))  # 出力: 0
