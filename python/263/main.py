import heapq
from collections import defaultdict
from typing import List


def sliding_window_median(nums: List[int], k: int) -> List[float]:
    """
    2ヒープ(+遅延削除)で O(n log k)
      lo: 最大ヒープ(負値で実装) … 小さい側
      hi: 最小ヒープ                 … 大きい側
    不変条件:
      - lo の最大値 <= hi の最小値
      - k が奇数: len(lo) = len(hi) + 1
        k が偶数: len(lo) = len(hi)
    """
    lo, hi = [], []  # loはmax-heap(負符号), hiはmin-heap
    delayed = defaultdict(int)  # 値 -> 削除待ちカウント
    size_lo = size_hi = 0

    def prune(heap):
        """ヒープの先頭が削除マーク済みなら捨て続ける"""
        if heap is lo:
            while lo and delayed[-lo[0]] > 0:
                x = -heapq.heappop(lo)
                delayed[x] -= 1
        else:
            while hi and delayed[hi[0]] > 0:
                x = heapq.heappop(hi)
                delayed[x] -= 1

    def rebalance():
        """サイズ不変条件を満たすように再バランス"""
        nonlocal size_lo, size_hi
        # lo が多すぎ
        if size_lo > size_hi + (k & 1):
            x = -heapq.heappop(lo)
            heapq.heappush(hi, x)
            size_lo -= 1
            size_hi += 1
            prune(lo)
        # hi が多すぎ
        elif size_hi > size_lo:
            x = heapq.heappop(hi)
            heapq.heappush(lo, -x)
            size_hi -= 1
            size_lo += 1
            prune(hi)

    def add_num(x):
        nonlocal size_lo, size_hi
        if not lo or x <= -lo[0]:
            heapq.heappush(lo, -x)
            size_lo += 1
        else:
            heapq.heappush(hi, x)
            size_hi += 1
        rebalance()

    def remove_num(x):
        """x を削除マーク。実体はトップに出てきたとき prune で除去"""
        nonlocal size_lo, size_hi
        delayed[x] += 1
        # どちら側に属しているはずかでサイズを先に減らす
        if lo and x <= -lo[0]:
            size_lo -= 1
            if x == -lo[0]:
                prune(lo)
        else:
            size_hi -= 1
            if hi and x == hi[0]:
                prune(hi)
        rebalance()

    def get_median() -> float:
        if k % 2 == 1:
            return float(-lo[0])
        else:
            return (-lo[0] + hi[0]) / 2.0

    res = []
    for i, x in enumerate(nums):
        add_num(x)
        if i >= k:
            remove_num(nums[i - k])
        if i >= k - 1:
            res.append(get_median())
    return res


# 動作確認
if __name__ == "__main__":
    print(
        sliding_window_median([1, 3, -1, -3, 5, 3, 6, 7], 3)
    )  # [1.0, -1.0, -1.0, 3.0, 5.0, 6.0]
    print(sliding_window_median([1, 2, 3, 4], 2))  # [1.5, 2.5, 3.5]
    print(sliding_window_median([2], 1))  # [2.0]
