from typing import List
import bisect


def max_of_window_min_abs_diff(nums: List[int], k: int) -> int:
    if k <= 1:
        # 2要素が無いので「任意の2要素の差の最小」は定義しづらいが、
        # 実務/面接では k>=2 とすることが多い。ここでは 0 とする。
        return 0

    window = []  # ソート済みリスト

    def window_min_diff(arr: List[int]) -> int:
        # arr はソート済み。隣接差の最小が答え
        best = 10**30
        for i in range(1, len(arr)):
            d = arr[i] - arr[i - 1]
            if d < best:
                best = d
                if best == 0:
                    return 0
        return best

    # 初期ウィンドウ
    for x in nums[:k]:
        bisect.insort(window, x)

    ans = window_min_diff(window)

    # スライド
    for i in range(k, len(nums)):
        out = nums[i - k]
        inp = nums[i]

        # 削除（同値があるので左端を消す）
        idx = bisect.bisect_left(window, out)
        window.pop(idx)

        # 追加
        bisect.insort(window, inp)

        ans = max(ans, window_min_diff(window))

    return ans


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        ([1, 5, 9, 2, 6], 3, 4),
        ([10, 11, 12, 13], 2, 1),
        ([3, 3, 3, 3], 3, 0),
    ]

    for i, (nums, k, expected) in enumerate(cases, start=1):
        got = max_of_window_min_abs_diff(nums, k)
        print(f"例{i} 入力: nums={nums}, k={k}")
        print(f"例{i} 出力: {got} (期待値: {expected})")
        print("-" * 60)
