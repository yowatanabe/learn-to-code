from typing import List


def count_even_sum_pairs(nums: List[int]) -> int:
    even = 0
    odd = 0

    for num in nums:
        if num % 2 == 0:
            even += 1
        else:
            odd += 1

    # 組み合わせの数: nC2 = n * (n-1) // 2
    return (even * (even - 1) // 2) + (odd * (odd - 1) // 2)


# 簡単なテスト
print(count_even_sum_pairs([1, 2, 3, 4]))  # 出力: 2
print(count_even_sum_pairs([2, 4, 6]))  # 出力: 2
print(count_even_sum_pairs([1, 3, 5]))  # 出力: 2
