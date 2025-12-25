from typing import List


def min_subarray_len(target: int, nums: List[int]) -> int:
    n = len(nums)
    left = 0
    total = 0
    best = float("inf")

    for right in range(n):
        total += nums[right]

        # 条件を満たす間は左を縮めて最短化
        while total >= target:
            best = min(best, right - left + 1)
            total -= nums[left]
            left += 1

    return 0 if best == float("inf") else best


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        (7, [2, 3, 1, 2, 4, 3]),
        (4, [1, 4, 4]),
        (11, [1, 1, 1, 1, 1, 1, 1, 1]),
    ]

    for i, (target, nums) in enumerate(cases, start=1):
        print(f"例{i} 入力: target={target}, nums={nums}")
        print(f"例{i} 出力: {min_subarray_len(target, nums)}")
        print("-" * 40)
