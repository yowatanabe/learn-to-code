import math
from typing import List


def min_eating_speed(piles: List[int], h: int) -> int:
    """
    二分探索（答えに対して単調性がある）:
      - 速度 k が大きいほど必要時間は短くなる（単調減少）。
      - 下限 = 1, 上限 = max(piles)
      - 判定: ある k で合計時間 sum(ceil(p/k)) <= h ?
    時間: O(n log max(piles)), 追加メモリ: O(1)
    """
    left, right = 1, max(piles)

    def can_finish(k: int) -> bool:
        hours = 0
        for p in piles:
            # math.ceil(p / k) を整数演算で: (p + k - 1) // k でもOK
            hours += (p + k - 1) // k
            if hours > h:  # 早期打ち切り
                return False
        return hours <= h

    while left < right:
        mid = (left + right) // 2
        if can_finish(mid):
            right = mid
        else:
            left = mid + 1
    return left


# テスト
print(min_eating_speed([3, 6, 7, 11], 8))  # 4
print(min_eating_speed([30, 11, 23, 4, 20], 5))  # 30
print(min_eating_speed([30, 11, 23, 4, 20], 6))  # 23
