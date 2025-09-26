from collections import defaultdict
from typing import List


def subarray_sum_equals_k(nums: List[int], k: int) -> int:
    """
    累積和 prefix と辞書（余事象ではなく“値そのもの”）で数える。
    位置 i までの累積和を P[i] とすると、任意の j<i に対し
      P[i] - P[j] == k  <=>  P[j] == P[i] - k
    よって各 i で「これまでに現れた P[i]-k の回数」を足し込めばよい。
    時間 O(n), 追加メモリ O(n)。
    """
    count = defaultdict(int)
    count[0] = 1  # 空の prefix（先頭より前）を1つとして数える
    prefix = 0
    ans = 0

    for x in nums:
        prefix += x
        ans += count[prefix - k]
        count[prefix] += 1

    return ans


# テスト
print(subarray_sum_equals_k([1, 1, 1], 2))  # 2
print(subarray_sum_equals_k([1, 2, 3], 3))  # 2
print(subarray_sum_equals_k([3, 4, 7, 2, -3, 1, 4, 2], 7))  # 4
print(subarray_sum_equals_k([-1, -1, 1], 0))  # 1
