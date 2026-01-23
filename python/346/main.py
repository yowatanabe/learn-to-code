from typing import List


def ship_within_days(weights: List[int], days: int) -> int:
    # capacity の下限は最大要素（これ未満だと積めない）
    left = max(weights)
    # 上限は合計（1日ですべて積む）
    right = sum(weights)

    def can(capacity: int) -> bool:
        used_days = 1
        cur = 0
        for w in weights:
            if cur + w <= capacity:
                cur += w
            else:
                used_days += 1
                cur = w
                if used_days > days:
                    return False
        return True

    while left < right:
        mid = (left + right) // 2
        if can(mid):
            right = mid
        else:
            left = mid + 1

    return left


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        ([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 5, 15),
        ([3, 2, 2, 4, 1, 4], 3, 6),
        ([1, 2, 3, 1, 1], 4, 3),
    ]

    for i, (weights, days, expected) in enumerate(cases, start=1):
        got = ship_within_days(weights, days)
        print(f"例{i} 入力: weights={weights}, days={days}")
        print(f"例{i} 出力: {got} (期待値: {expected})")
        print("-" * 60)
