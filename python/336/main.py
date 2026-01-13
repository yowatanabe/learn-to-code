from typing import List
import bisect


def min_removals_to_make_increasing(nums: List[int]) -> int:
    tails: List[int] = []  # tails[len-1] = 長さlenの増加部分列の末尾の最小値

    for x in nums:
        i = bisect.bisect_left(tails, x)  # 厳密増加なので left
        if i == len(tails):
            tails.append(x)
        else:
            tails[i] = x

    lis_len = len(tails)
    return len(nums) - lis_len


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        ([3, 1, 2, 1, 4], 2),
        ([1, 2, 3, 4], 0),
        ([5, 4, 3, 2, 1], 4),
    ]

    for i, (nums, expected) in enumerate(cases, start=1):
        got = min_removals_to_make_increasing(nums)
        print(f"例{i} 入力: nums={nums}")
        print(f"例{i} 出力: {got} (期待値: {expected})")
        print("-" * 50)
