from typing import List


def minimize_peak_load(loads: List[int], m: int) -> int:
    """
    loads を高々 m 個の連続部分配列に分割したときの
    「部分配列合計の最大値」の最小値を返す。
    二分探索 + 貪欲判定。O(n log sum(loads))
    """
    n = len(loads)
    if n == 0:
        return 0

    # 下限: どのグループにも最大要素は必ず含まれる
    lo = max(loads)
    # 上限: 1 グループに全て入れる
    hi = sum(loads)

    def can(limit: int) -> bool:
        """最大合計 limit 以内で高々 m グループに分割できるか"""
        groups = 1
        acc = 0
        for x in loads:
            if acc + x <= limit:
                acc += x
            else:
                groups += 1
                acc = x
                if groups > m:  # 既に m を超えるなら不可
                    return False
        return True

    # 二分探索
    while lo < hi:
        mid = (lo + hi) // 2
        if can(mid):
            hi = mid
        else:
            lo = mid + 1
    return lo


print(minimize_peak_load([7, 2, 5, 10, 8], 2))
print(minimize_peak_load([1, 2, 3, 4, 5], 2))
print(minimize_peak_load([0, 0, 0], 5))
print(minimize_peak_load([], 1))
