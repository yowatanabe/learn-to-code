from typing import List

def min_increments_to_non_decreasing(intervals: List[int]) -> int:
    """
    配列を左から見ていき、
    直前の値より小さい要素があれば、直前の値まで引き上げる。

    例:
      [3, 1, 2, 1, 5]
       ^
      1 は 3 まで増やす必要がある -> 2回

    計算量: O(n)
    """
    if not intervals:
        return 0

    operations = 0
    prev = intervals[0]

    for i in range(1, len(intervals)):
        if intervals[i] < prev:
            operations += prev - intervals[i]
        else:
            prev = intervals[i]

    return operations


if __name__ == "__main__":
    print(min_increments_to_non_decreasing([1, 1, 1]))        # 0
    print(min_increments_to_non_decreasing([3, 1, 2, 1, 5]))  # 5
    print(min_increments_to_non_decreasing([0, 5, 2, 2]))     # 6
