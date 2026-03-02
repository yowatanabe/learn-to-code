from typing import List

def longest_unique_subarray(events: List[int]) -> int:
    """
    スライディングウィンドウ（Two Pointers）
    各値の最後に出現した位置を記録しながら、
    左端を必要に応じてジャンプさせる。

    計算量: O(n)
    """

    last_seen = {}
    left = 0
    best = 0

    for right, value in enumerate(events):
        if value in last_seen and last_seen[value] >= left:
            left = last_seen[value] + 1

        last_seen[value] = right
        best = max(best, right - left + 1)

    return best


if __name__ == "__main__":
    print(longest_unique_subarray([1, 2, 3, 1, 2, 3, 4]))  # 4
    print(longest_unique_subarray([5, 5, 5, 5]))           # 1
    print(longest_unique_subarray([1, 2, 3, 4, 5]))        # 5
