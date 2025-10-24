from typing import List


def min_processing_rate(batches: List[int], H: int) -> int:
    """
    各バッチ量 batches を、1分あたりR件まで処理できるとして
    H分以内に全完了させる最小の整数Rを二分探索で求める。
    時間: O(n log max(batches))
    """
    # 下限は1、上限は最大バッチ（1分でそのバッチを終える場合）
    lo, hi = 1, max(batches)

    # 判定: レートRでH分以内に終えられるか？
    def can(R: int) -> bool:
        # sum(ceil(b / R)) をオーバーフローなく計算
        total = 0
        for b in batches:
            total += (b + R - 1) // R
            if total > H:  # 早期終了
                return False
        return total <= H

    while lo < hi:
        mid = (lo + hi) // 2
        if can(mid):
            hi = mid
        else:
            lo = mid + 1
    return lo


print(min_processing_rate([30, 11, 23, 4, 20], 6))
print(min_processing_rate([5, 5, 5], 3))
print(min_processing_rate([1000000000], 1))
print(min_processing_rate([1, 2, 3, 4], 10))
