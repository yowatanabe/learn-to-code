from typing import List

def max_sum_two_no_overlap(nums: List[int], firstLen: int, secondLen: int) -> int:
    n = len(nums)

    # prefix sums
    prefix = [0] * (n + 1)
    for i, x in enumerate(nums):
        prefix[i + 1] = prefix[i] + x

    def sub_sum(l: int, r: int) -> int:
        # sum of nums[l:r]
        return prefix[r] - prefix[l]

    def best(L: int, M: int) -> int:
        """
        L長の区間が先、M長の区間が後に来るケースを最大化
        """
        ans = -10**30
        max_L = -10**30

        # M の開始位置を i とすると、L は i より左側に収まる必要がある
        # i は M の開始。L の終端は i まで。
        for i in range(L, n - M + 1):
            # L区間: [i-L, i)
            max_L = max(max_L, sub_sum(i - L, i))
            # M区間: [i, i+M)
            ans = max(ans, max_L + sub_sum(i, i + M))
        return ans

    return max(best(firstLen, secondLen), best(secondLen, firstLen))


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        ([0, 6, 5, 2, 2, 5, 1, 9, 4], 1, 2, 20),
        ([3, 8, 1, 3, 2, 1, 8, 9, 0], 3, 2, 29),
        ([2, 1, 5, 6, 0, 9, 5, 0, 3, 8], 4, 3, 31),
    ]

    for i, (nums, firstLen, secondLen, expected) in enumerate(cases, start=1):
        got = max_sum_two_no_overlap(nums, firstLen, secondLen)
        print(f"例{i} 入力: nums={nums}, firstLen={firstLen}, secondLen={secondLen}")
        print(f"例{i} 出力: {got} (期待値: {expected})")
        print("-" * 60)
