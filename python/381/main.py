from typing import List

def split_load_minimize_max(load: List[int], m: int) -> int:
    """
    '最大グループ和の最小値' は二分探索で解ける典型問題。
    候補 X（最大グループ和）を決めたとき、
    - 各グループの和 <= X になるように左から貪欲に区切ると
      必要なグループ数の最小が求まる。
    - 必要グループ数 <= m なら X は実現可能（m個ちょうどは、分割を増やして調整できる）。

    探索範囲:
    - 下限 = max(load)（どのグループも要素を含むので）
    - 上限 = sum(load)（全部1グループ）

    計算量: O(n log(sum(load)))
    """
    lo, hi = max(load), sum(load)

    def can(x: int) -> bool:
        groups = 1
        s = 0
        for v in load:
            if s + v <= x:
                s += v
            else:
                groups += 1
                s = v
                if groups > m:
                    return False
        return True

    while lo < hi:
        mid = (lo + hi) // 2
        if can(mid):
            hi = mid
        else:
            lo = mid + 1

    return lo

if __name__ == "__main__":
    print(split_load_minimize_max([7, 2, 5, 10, 8], 2))  # 18
    print(split_load_minimize_max([1, 2, 3, 4, 5], 2))   # 9
    print(split_load_minimize_max([1, 4, 4], 3))         # 4
