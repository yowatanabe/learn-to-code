from typing import List


def max_events_in_window(timestamps: List[int], W: int) -> int:
    """
    昇順 timestamps と幅 W に対し、任意の連続区間 [t, t+W]（両端含む）に
    含まれるイベント数の最大値を O(n) で返す。

    アルゴリズム（スライディングウィンドウ／二本ポインタ）:
      - 右ポインタ r を 0..n-1 で進める。
      - 各 r に対し、区間幅が W を超える (= timestamps[r] - timestamps[l] > W)
        なら左ポインタ l を前に送って条件を満たすまで縮める。
      - 毎回ウィンドウサイズ (r - l + 1) で最大値を更新。
    これで「右端 timestamps[r] を含む最良の左端」を貪欲に保てる。
    """
    n = len(timestamps)
    if n == 0:
        return 0

    l = 0
    best = 0
    for r in range(n):
        # 幅が W を超えるなら左端を縮める（右端 timestamps[r] を固定）
        while timestamps[r] - timestamps[l] > W:
            l += 1
        # 現在のウィンドウ [l, r] は条件を満たす。大きさを更新。
        best = max(best, r - l + 1)
    return best


# 簡単なテスト
# if __name__ == "__main__":
#     tests = [
#         # (timestamps, W, expected)
#         ([1, 2, 3, 10, 11, 12], 2, 3),
#         ([0, 0, 1, 2, 2, 2, 5], 0, 3),
#         ([5, 6, 7, 8], 10, 4),
#         ([], 100, 0),
#         ([1, 1, 1, 1], 0, 4),
#         ([1, 3, 3, 3, 10], 1, 3),  # [3,4] 内で3件
#         ([1, 3, 6, 10], 2, 1),  # どの幅2s窓にも最大1件
#     ]

#     for i, (ts, w, exp) in enumerate(tests, 1):
#         got = max_events_in_window(ts, w)
#         assert got == exp, f"case{i}: expected {exp}, got {got}"
#     print("All tests passed.")


print(max_events_in_window([1, 2, 3, 10, 11, 12], 2))  # 3
print(max_events_in_window([0, 0, 1, 2, 2, 2, 5], 0))  # 3
print(max_events_in_window([5, 6, 7, 8], 10))  # 4
print(max_events_in_window([], 100))  # 0
