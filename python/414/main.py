from typing import List

def min_bandwidth(files: List[int], h: int) -> int:
    """
    二分探索の典型問題。

    帯域幅 x を決めると、
    各ファイルに必要な時間の合計を O(n) で計算できる。

    - x が小さいほど必要時間は大きい
    - x が大きいほど必要時間は小さい

    つまり「条件を満たす最小の x」を二分探索できる。

    計算量: O(n log M)
    M = max(files)
    """

    def can_finish(speed: int) -> bool:
        total_hours = 0
        for size in files:
            # ceil(size / speed) を整数演算で書く
            total_hours += (size + speed - 1) // speed
            if total_hours > h:
                return False
        return True

    left, right = 1, max(files)

    while left < right:
        mid = (left + right) // 2
        if can_finish(mid):
            right = mid
        else:
            left = mid + 1

    return left


if __name__ == "__main__":
    print(min_bandwidth([3, 6, 7, 11], 8))          # 4
    print(min_bandwidth([30, 11, 23, 4, 20], 5))    # 30
    print(min_bandwidth([30, 11, 23, 4, 20], 6))    # 23
