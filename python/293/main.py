from typing import List
from collections import defaultdict


def subarray_sum(nums: List[int], k: int) -> int:
    """
    和が k となる連続部分配列の個数を返す。
    prefix sum + ハッシュマップで O(n) で解く。
    """
    count = 0
    prefix_sum = 0
    # prefix_sum の値が「何回出現したか」を記録
    # 「何も取っていない状態」の累積和 0 が1回ある、として初期化
    prefix_count = defaultdict(int)
    prefix_count[0] = 1

    for num in nums:
        prefix_sum += num

        # (prefix_sum - k) が過去に出ていた回数だけ、
        # 「今の位置を右端とした和が k の部分配列」が存在する
        target = prefix_sum - k
        if target in prefix_count:
            count += prefix_count[target]

        # 今の prefix_sum を記録
        prefix_count[prefix_sum] += 1

    return count


if __name__ == "__main__":
    # 実行例1
    nums1 = [1, 1, 1]
    k1 = 2
    print("例1の入力:", nums1, "k =", k1)
    print("例1の結果:", subarray_sum(nums1, k1))  # 2

    # 実行例2
    nums2 = [1, 2, 3]
    k2 = 3
    print("例2の入力:", nums2, "k =", k2)
    print("例2の結果:", subarray_sum(nums2, k2))  # 2

    # 実行例3
    nums3 = [3, 4, 7, 2, -3, 1, 4, 2]
    k3 = 7
    print("例3の入力:", nums3, "k =", k3)
    print("例3の結果:", subarray_sum(nums3, k3))  # 期待値: 4
