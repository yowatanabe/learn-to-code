from typing import List


def product_except_self(nums: List[int]) -> List[int]:
    n = len(nums)
    ans = [1] * n

    # prefix
    pref = 1
    for i in range(n):
        ans[i] = pref
        pref *= nums[i]

    # suffix
    suff = 1
    for i in range(n - 1, -1, -1):
        ans[i] *= suff
        suff *= nums[i]

    return ans


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        ([1, 2, 3, 4], [24, 12, 8, 6]),
        ([-1, 1, 0, -3, 3], [0, 0, 9, 0, 0]),
    ]

    for i, (nums, expected) in enumerate(cases, start=1):
        got = product_except_self(nums)
        print(f"例{i} 入力: nums={nums}")
        print(f"例{i} 出力: {got} (期待値: {expected})")
        print("-" * 60)
