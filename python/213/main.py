import random
from typing import List


def find_kth_largest(nums: List[int], k: int) -> int:
    """
    クイックセレクト（平均 O(n)）。k番目に大きい = (n-k) 番目に小さい要素を求める。
    """
    n = len(nums)
    target = n - k  # 昇順で見たときのインデックス

    def partition(lo: int, hi: int, pivot_idx: int) -> int:
        pivot = nums[pivot_idx]
        # ピボットを末尾へ退避
        nums[pivot_idx], nums[hi] = nums[hi], nums[pivot_idx]
        store = lo
        for i in range(lo, hi):
            if nums[i] < pivot:
                nums[store], nums[i] = nums[i], nums[store]
                store += 1
        # ピボットを確定位置に戻す
        nums[store], nums[hi] = nums[hi], nums[store]
        return store

    lo, hi = 0, n - 1
    while lo <= hi:
        pivot_idx = random.randint(lo, hi)  # 乱択で平均計算量を担保
        p = partition(lo, hi, pivot_idx)
        if p == target:
            return nums[p]
        elif p < target:
            lo = p + 1
        else:
            hi = p - 1

    # 理論上ここには来ない
    raise RuntimeError("Unexpected state")


# テスト
print(find_kth_largest([3, 2, 1, 5, 6, 4], 2))  # 5
print(find_kth_largest([3, 2, 3, 1, 2, 4, 5, 5, 6], 4))  # 4
print(find_kth_largest([1], 1))  # 1
print(find_kth_largest([7, 7, 7, 7], 3))  # 7
