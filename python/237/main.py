from typing import List


def longest_consecutive(nums: List[int]) -> int:
    """
    O(n) 解法:
      - 集合に入れて重複を排除しつつ O(1) 参照を得る
      - ある数 x が「列の先頭」である条件は x-1 が集合にないこと
      - 先頭から x+1, x+2, ... と伸ばして長さを測る
    """
    if not nums:
        return 0

    s = set(nums)
    best = 0

    for x in s:
        if x - 1 not in s:  # 先頭のときだけ伸ばす（各要素は高々1回起点になる）
            y = x
            while y in s:
                y += 1
            best = max(best, y - x)

    return best


# テスト
print(longest_consecutive([100, 4, 200, 1, 3, 2]))  # 4
print(longest_consecutive([0, 3, 7, 2, 5, 8, 4, 6, 0, 1]))  # 9
print(longest_consecutive([]))  # 0
print(longest_consecutive([1, 2, 0, 1]))  # 3
