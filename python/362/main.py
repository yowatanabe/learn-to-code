from typing import List

def min_subarray_len(target: int, nums: List[int]) -> int:
    n = len(nums)
    left = 0
    total = 0
    min_len = float('inf')

    for right in range(n):
        total += nums[right]

        while total >= target:
            min_len = min(min_len, right - left + 1)
            total -= nums[left]
            left += 1

    return min_len if min_len != float('inf') else 0


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        (7, [2, 3, 1, 2, 4, 3], 2),
        (4, [1, 4, 4], 1),
        (11, [1, 1, 1, 1, 1, 1], 0),
    ]

    for i, (target, nums, expected) in enumerate(cases, start=1):
        got = min_subarray_len(target, nums)
        print(f"例{i} 入力: target={target}, nums={nums}")
        print(f"例{i} 出力: {got} (期待値: {expected})")
        print("-" * 60)
