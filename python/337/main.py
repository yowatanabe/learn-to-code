from typing import List


def longest_consecutive(nums: List[int]) -> int:
    s = set(nums)
    best = 0

    for x in s:
        # 先頭（x-1が無い）だけを起点にする
        if x - 1 not in s:
            cur = x
            length = 1
            while cur + 1 in s:
                cur += 1
                length += 1
            best = max(best, length)

    return best


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        ([100, 4, 200, 1, 3, 2], 4),
        ([0, 3, 7, 2, 5, 8, 4, 6, 0, 1], 9),
        ([], 0),
    ]

    for i, (nums, expected) in enumerate(cases, start=1):
        got = longest_consecutive(nums)
        print(f"例{i} 入力: nums={nums}")
        print(f"例{i} 出力: {got} (期待値: {expected})")
        print("-" * 50)
