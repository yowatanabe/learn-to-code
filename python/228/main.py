from typing import List


def max_difference(nums: List[int]) -> int:
    """
    インデックス i < j の条件で nums[j] - nums[i] を最大化する。
    -> 配列を左から走査し、これまでの最小値を記録しつつ差を更新する。
    時間 O(n), 追加メモリ O(1)。
    """
    min_val = nums[0]
    max_diff = 0

    for x in nums[1:]:
        # 差を更新
        max_diff = max(max_diff, x - min_val)
        # 最小値を更新
        min_val = min(min_val, x)

    return max_diff


# テスト
print(max_difference([7, 1, 5, 3, 6, 4]))  # 5
print(max_difference([7, 6, 4, 3, 1]))  # 0
print(max_difference([2, 4, 1]))  # 2
