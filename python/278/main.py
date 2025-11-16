from typing import List


def count_pairs(nums: List[int], k: int) -> int:
    """
    配列 nums の中から、和が k になる異なる整数ペアの数を求める。
    ハッシュセットを使って O(n) 時間で解く。
    """
    seen = set()
    pairs = set()

    for num in nums:
        target = k - num
        if target in seen:
            # 既に target を見たら、ペア (target, num) を記録
            pairs.add(tuple(sorted([num, target])))
        seen.add(num)

    return len(pairs)


# 要求どおり、print で結果を出力する部分
if __name__ == "__main__":
    # 例1
    nums1 = [1, 2, 3, 4, 5]
    k1 = 5
    print(count_pairs(nums1, k1))  # 2

    # 例2
    nums2 = [1, 2, 2, 3, 4]
    k2 = 4
    print(count_pairs(nums2, k2))  # 2

    # 例3
    nums3 = [1, 1, 1, 1]
    k3 = 2
    print(count_pairs(nums3, k3))  # 1

    # 例4
    nums4 = [1, 2, 3]
    k4 = 6
    print(count_pairs(nums4, k4))  # 0
