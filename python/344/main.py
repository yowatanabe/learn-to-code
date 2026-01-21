from typing import List


def split_array_largest_sum(nums: List[int], m: int) -> int:
    if not nums:
        return 0

    left = max(nums)  # これ未満は絶対無理
    right = sum(nums)  # これなら必ず可能（全部1つ）

    def can(limit: int) -> bool:
        parts = 1
        cur = 0
        for x in nums:
            if cur + x <= limit:
                cur += x
            else:
                parts += 1
                cur = x
                if parts > m:
                    return False
        return True

    while left < right:
        mid = (left + right) // 2
        if can(mid):
            right = mid
        else:
            left = mid + 1

    return left


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        ([7, 2, 5, 10, 8], 2, 18),
        ([1, 2, 3, 4, 5], 2, 9),
        ([1, 4, 4], 3, 4),
    ]

    for i, (nums, m, expected) in enumerate(cases, start=1):
        got = split_array_largest_sum(nums, m)
        print(f"例{i} 入力: nums={nums}, m={m}")
        print(f"例{i} 出力: {got} (期待値: {expected})")
        print("-" * 60)
