from typing import List


def longest_consecutive(nums: List[int]) -> int:
    """
    O(n) 解法: セットを使い、"連続列の始点" だけから長さを数える。
    始点条件: (x-1) が集合に存在しないとき、その x から右に伸ばす。
    各要素は高々1回ずつ伸ばしでカウントされるため全体 O(n)。
    """
    if not nums:
        return 0

    s = set(nums)
    best = 0

    for x in s:
        if (x - 1) not in s:  # 始点のみ処理
            y = x
            while y in s:
                y += 1
            best = max(best, y - x)

    return best


# テスト
print(longest_consecutive([100, 4, 200, 1, 3, 2]))  # 4
print(longest_consecutive([0, 3, 7, 2, 5, 8, 4, 6, 0, 1]))  # 9
print(longest_consecutive([]))  # 0
print(longest_consecutive([9]))  # 1
print(longest_consecutive([10, 5, 12, 3, 55, 11, 4, 13]))  # 4
