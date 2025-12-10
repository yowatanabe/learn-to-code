from typing import List


def longest_consecutive(nums: List[int]) -> int:
    """
    配列 nums から、値が連続する要素列の最長長さを O(n) で求める。
    """
    if not nums:
        return 0

    num_set = set(nums)  # 重複排除 & O(1) ルックアップ
    longest = 0

    for x in num_set:
        # x-1 が存在しない場合だけ「連続列のスタート」とみなす
        if (x - 1) not in num_set:
            current = x
            length = 1  # x 自身

            # x+1, x+2, ... と連続して存在する限り伸ばす
            while (current + 1) in num_set:
                current += 1
                length += 1

            longest = max(longest, length)

    return longest


if __name__ == "__main__":
    # 実行例1
    nums1 = [100, 4, 200, 1, 3, 2]
    print("例1の入力:", nums1)
    print("例1の結果:", longest_consecutive(nums1))  # 4

    # 実行例2
    nums2 = [0, 3, 7, 2, 5, 8, 4, 6, 0, 1]
    print("例2の入力:", nums2)
    print("例2の結果:", longest_consecutive(nums2))  # 9

    # 実行例3
    nums3 = []
    print("例3の入力:", nums3)
    print("例3の結果:", longest_consecutive(nums3))  # 0

    # 実行例4
    nums4 = [9, 9, 9]
    print("例4の入力:", nums4)
    print("例4の結果:", longest_consecutive(nums4))  # 1
