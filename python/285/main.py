def product_except_self(nums):
    """
    各位置 i について nums[i] 以外の要素の積を計算して返す。
    割り算は使わず、左右の積（prefix / suffix）を利用して O(n) で解く。
    """
    n = len(nums)
    # 結果用配列（ここに「左側の積」をまず入れていく）
    res = [1] * n

    # 左から走査して「左側の積」を res に入れる
    left_prod = 1
    for i in range(n):
        res[i] = left_prod
        left_prod *= nums[i]

    # 右から走査して「右側の積」を掛け合わせる
    right_prod = 1
    for i in range(n - 1, -1, -1):
        res[i] *= right_prod
        right_prod *= nums[i]

    return res


if __name__ == "__main__":
    # 実行例1
    nums1 = [1, 2, 3, 4]
    print("例1の入力:", nums1)
    print("例1の結果:", product_except_self(nums1))  # [24, 12, 8, 6]

    # 実行例2
    nums2 = [-1, 1, 0, -3, 3]
    print("例2の入力:", nums2)
    print("例2の結果:", product_except_self(nums2))  # [0, 0, 9, 0, 0]
