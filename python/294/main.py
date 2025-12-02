from typing import List


def search_rotated(nums: List[int], target: int) -> int:
    """
    回転されたソート配列 nums から target を二分探索で探し、
    見つかればそのインデックス、なければ -1 を返す。
    時間計算量 O(log n)。
    """
    left, right = 0, len(nums) - 1

    while left <= right:
        mid = (left + right) // 2

        if nums[mid] == target:
            return mid

        # 左半分 [left, mid] がソートされているか？
        if nums[left] <= nums[mid]:
            # target はこのソートされた左半分の範囲内か？
            if nums[left] <= target < nums[mid]:
                # 左側に絞る
                right = mid - 1
            else:
                # それ以外は右側へ
                left = mid + 1
        else:
            # 右半分 [mid, right] がソートされている
            if nums[mid] < target <= nums[right]:
                # target はソートされた右半分にある
                left = mid + 1
            else:
                # それ以外は左側へ
                right = mid - 1

    # 見つからなかった
    return -1


if __name__ == "__main__":
    # 実行例1
    nums1 = [4, 5, 6, 7, 0, 1, 2]
    target1 = 0
    print("例1の入力:", nums1, "target =", target1)
    print("例1の結果:", search_rotated(nums1, target1))  # 4

    # 実行例2
    nums2 = [4, 5, 6, 7, 0, 1, 2]
    target2 = 3
    print("例2の入力:", nums2, "target =", target2)
    print("例2の結果:", search_rotated(nums2, target2))  # -1

    # 実行例3
    nums3 = [1]
    target3 = 0
    print("例3の入力:", nums3, "target =", target3)
    print("例3の結果:", search_rotated(nums3, target3))  # -1

    # 実行例4
    nums4 = [1]
    target4 = 1
    print("例4の入力:", nums4, "target =", target4)
    print("例4の結果:", search_rotated(nums4, target4))  # 0
