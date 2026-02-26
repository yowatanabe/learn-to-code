from typing import List

def min_window_len(cnt: List[int], target: int) -> int:
    """
    典型: 正の値(>=0)の配列で target 以上の最短部分配列長 → sliding window。

    left..right の合計が target 以上になったら、左を詰めて短くできるだけ短くする。
    計算量: O(n)
    """
    n = len(cnt)
    left = 0
    s = 0
    ans = n + 1

    for right, x in enumerate(cnt):
        s += x
        while s >= target and left <= right:
            ans = min(ans, right - left + 1)
            s -= cnt[left]
            left += 1

    return 0 if ans == n + 1 else ans

if __name__ == "__main__":
    print(min_window_len([2, 3, 1, 2, 4, 3], 7))  # 2
    print(min_window_len([1, 1, 1, 1], 10))       # 0
    print(min_window_len([7], 7))                 # 1
