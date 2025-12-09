from typing import List


def length_of_LIS(nums: List[int]) -> int:
    """
    最長増加部分列（LIS）の長さを O(n^2) DP で求める。
    dp[i]: nums[i] を「最後の要素」とする増加部分列の最大長
    """
    n = len(nums)
    if n == 0:
        return 0

    # どの要素単体でも長さ1の増加部分列になる
    dp = [1] * n

    for i in range(n):
        for j in range(i):
            # nums[j] < nums[i] なら nums[i] を nums[j] の後ろにくっつけられる
            if nums[j] < nums[i]:
                dp[i] = max(dp[i], dp[j] + 1)

    # 配列のどの位置で終わるかは問わないので最大値が答え
    return max(dp)


if __name__ == "__main__":
    # 実行例1
    nums1 = [10, 9, 2, 5, 3, 7, 101, 18]
    print("例1の入力:", nums1)
    print("例1の結果:", length_of_LIS(nums1))  # 4

    # 実行例2
    nums2 = [0, 1, 0, 3, 2, 3]
    print("例2の入力:", nums2)
    print("例2の結果:", length_of_LIS(nums2))  # 4

    # 実行例3
    nums3 = [7, 7, 7, 7, 7]
    print("例3の入力:", nums3)
    print("例3の結果:", length_of_LIS(nums3))  # 1

    # 実行例4
    nums4 = [4, 10, 4, 3, 8, 9]
    print("例4の入力:", nums4)
    print("例4の結果:", length_of_LIS(nums4))  # 3
