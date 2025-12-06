from typing import List


def min_subarray_len(target: int, nums: List[int]) -> int:
    """
    合計が target 以上となる最短の連続部分配列の長さを返す。
    存在しない場合は 0 を返す。
    """
    n = len(nums)
    left = 0
    current_sum = 0
    ans = float("inf")  # 最小長を更新していく。初期値は「とても大きい値」

    for right in range(n):
        current_sum += nums[right]

        # 条件を満たす限り、左端を詰めて最短を目指す
        while current_sum >= target:
            # [left, right] の長さをチェック
            ans = min(ans, right - left + 1)
            # 左端を1つ右に動かす（区間を縮める）
            current_sum -= nums[left]
            left += 1

    # 一度も更新されなかった場合は 0
    return 0 if ans == float("inf") else ans


if __name__ == "__main__":
    # 実行例1
    target1 = 7
    nums1 = [2, 3, 1, 2, 4, 3]
    print("例1の入力:", "target =", target1, "nums =", nums1)
    print("例1の結果:", min_subarray_len(target1, nums1))  # 2

    # 実行例2
    target2 = 4
    nums2 = [1, 4, 4]
    print("例2の入力:", "target =", target2, "nums =", nums2)
    print("例2の結果:", min_subarray_len(target2, nums2))  # 1

    # 実行例3
    target3 = 11
    nums3 = [1, 2, 3, 4, 5]
    print("例3の入力:", "target =", target3, "nums =", nums3)
    print("例3の結果:", min_subarray_len(target3, nums3))  # 3

    # 実行例4
    target4 = 100
    nums4 = [1, 2, 3]
    print("例4の入力:", "target =", target4, "nums =", nums4)
    print("例4の結果:", min_subarray_len(target4, nums4))  # 0
