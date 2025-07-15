from collections import defaultdict


def count_zero_sum_subarrays(nums):
    prefix_sum = 0
    count = 0
    prefix_counts = defaultdict(int)
    prefix_counts[0] = 1  # 初期状態：合計0が1回あったとみなす

    for num in nums:
        prefix_sum += num
        count += prefix_counts[prefix_sum]
        prefix_counts[prefix_sum] += 1

    return count


# テスト
print(count_zero_sum_subarrays([1, -1, 2, -2, 3]))
print(count_zero_sum_subarrays([0, 0, 0]))
