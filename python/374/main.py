from typing import List

def max_window_within_k(timestamps: List[int], k: int) -> int:
    """
    Two pointers / sliding window.
    timestamps は昇順。
    条件: timestamps[right] - timestamps[left] <= k を満たす最大の (right-left+1) を探す。
    計算量: O(n), メモリ: O(1)
    """
    left = 0
    best = 0

    for right in range(len(timestamps)):
        while timestamps[right] - timestamps[left] > k:
            left += 1
        best = max(best, right - left + 1)

    return best

if __name__ == "__main__":
    # 実行例
    print(max_window_within_k([1, 2, 4, 7, 8, 10], 3))         # 3
    print(max_window_within_k([5, 5, 5, 9, 10, 10, 14], 0))    # 3
    print(max_window_within_k([1, 3, 6, 10], 2))               # 2
