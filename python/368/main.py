from typing import List

def min_days(bloomDay: List[int], m: int, k: int) -> int:
    n = len(bloomDay)
    if m * k > n:
        return -1

    lo, hi = min(bloomDay), max(bloomDay)

    def can_make(day: int) -> bool:
        bouquets = 0
        consec = 0
        for x in bloomDay:
            if x <= day:
                consec += 1
                if consec == k:
                    bouquets += 1
                    consec = 0
                    if bouquets >= m:
                        return True
            else:
                consec = 0
        return bouquets >= m

    while lo < hi:
        mid = (lo + hi) // 2
        if can_make(mid):
            hi = mid
        else:
            lo = mid + 1

    return lo


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        ([1, 10, 3, 10, 2], 3, 1, 3),
        ([1, 10, 3, 10, 2], 3, 2, -1),
        ([7, 7, 7, 7, 12, 7, 7], 2, 3, 12),
    ]

    for i, (bloomDay, m, k, expected) in enumerate(cases, start=1):
        got = min_days(bloomDay, m, k)
        print(f"例{i} 入力: bloomDay={bloomDay}, m={m}, k={k}")
        print(f"例{i} 出力: {got} (期待値: {expected})")
        print("-" * 60)
