from typing import List
from collections import defaultdict


def subarray_sum_equals_k(nums: List[int], k: int) -> int:
    count = defaultdict(int)
    count[0] = 1  # prefix=0 が1回（空の手前）
    prefix = 0
    ans = 0

    for x in nums:
        prefix += x
        ans += count[prefix - k]
        count[prefix] += 1

    return ans


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        ([1, 1, 1], 2),
        ([1, 2, 3], 3),
        ([1, -1, 0], 0),
    ]

    for i, (nums, k) in enumerate(cases, start=1):
        print(f"例{i} 入力: nums={nums}, k={k}")
        print(f"例{i} 出力: {subarray_sum_equals_k(nums, k)}")
        print("-" * 50)
