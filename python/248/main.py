from typing import List


def min_window_length_for_k_events(timestamps: List[int], K: int) -> int:
    """
    昇順 timestamps に対し、少なくとも K 件を含む最短区間長 W を返す。
    不可能なら -1。時間計算量 O(n)、追加メモリ O(1)。

    両端含みのため、連続 K 件を [i, i+K-1] とすると
    必要長は timestamps[i+K-1] - timestamps[i] の最小値。
    """
    n = len(timestamps)
    if K > n:
        return -1
    # K==1 なら0（同一点で良い）
    if K == 1:
        return 0

    ans = 10**18
    # 連続K個の先頭iを走査
    for i in range(0, n - K + 1):
        j = i + K - 1
        width = timestamps[j] - timestamps[i]
        if width < ans:
            ans = width

    return ans if ans != 10**18 else -1


print(min_window_length_for_k_events([1, 2, 3, 10, 11, 12], 3))
print(min_window_length_for_k_events([0, 0, 1, 2, 2, 2, 5], 4))
print(min_window_length_for_k_events([5, 6, 7, 8], 5))
print(min_window_length_for_k_events([100], 1))
