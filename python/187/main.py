def longest_consecutive(nums: list[int]) -> int:
    if not nums:
        return 0

    s = set(nums)
    best = 0

    for x in s:
        # 連続列の開始点（x-1 が存在しない）だけから伸ばす
        if x - 1 not in s:
            cur = x
            length = 1
            while cur + 1 in s:
                cur += 1
                length += 1
            best = max(best, length)

    return best


# テスト
print(longest_consecutive([100, 4, 200, 1, 3, 2]))  # 4
print(longest_consecutive([0, 3, 7, 2, 5, 8, 4, 6, 0, 1]))  # 9
print(longest_consecutive([]))  # 0
print(longest_consecutive([1, 2, 0, 1]))  # 3
