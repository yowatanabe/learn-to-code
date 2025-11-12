from collections import defaultdict
from typing import List


def count_subarrays_sum_k(nums: List[int], k: int) -> int:
    """
    連続部分配列で和がちょうど k になる個数を O(n) で数える。
    アルゴリズム: 累積和 + 頻度ハッシュ
      prefix を現在までの累積和とすると、
      ある位置 i までで prefix - k が過去に x 回出ていれば、
      その x 個ぶんの区間の和が k になる。
    """
    freq = defaultdict(int)
    freq[0] = 1  # 累積和0が1回出たとみなす（先頭からの区間を数えるため）
    ans = 0
    prefix = 0

    for x in nums:
        prefix += x
        ans += freq[prefix - k]  # prefix - (prefix - k) = k
        freq[prefix] += 1

    return ans


# 要求どおり print で出力
if __name__ == "__main__":
    print(count_subarrays_sum_k([1, 1, 1], 2))
    print(count_subarrays_sum_k([1, 2, 3], 3))
    print(count_subarrays_sum_k([3, 4, 7, -2, 2, 1, 4, 2], 7))
    print(count_subarrays_sum_k([], 0))
