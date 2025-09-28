from typing import List


def longest_even_sum_subarray(nums: List[int]) -> int:
    """
    アプローチ:
    - 累積和を使って偶奇だけを管理する。
    - 偶数/奇数の最初の出現位置を記録。
    - 同じ偶奇が再び出た場合、その間の部分配列は偶数和。
    """
    n = len(nums)
    prefix_parity = 0  # 0=偶数, 1=奇数
    first_occurrence = {0: -1}  # parity: index
    max_len = 0

    for i, num in enumerate(nums):
        prefix_parity = (prefix_parity + num) % 2
        if prefix_parity in first_occurrence:
            max_len = max(max_len, i - first_occurrence[prefix_parity])
        else:
            first_occurrence[prefix_parity] = i

    return max_len


# テスト
print(longest_even_sum_subarray([1, 2, 3, 4]))  # 4
print(longest_even_sum_subarray([2, 3, 5, 7]))  # 3
print(longest_even_sum_subarray([1, 3, 5]))  # 2
print(longest_even_sum_subarray([7]))  # 0
