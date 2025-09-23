from typing import List


def product_except_self(nums: List[int]) -> List[int]:
    n = len(nums)
    ans = [1] * n

    # 左からの累積積（i より左の積）を ans に入れる
    left = 1
    for i in range(n):
        ans[i] = left
        left *= nums[i]

    # 右からの累積積を掛け合わせる（i より右の積）
    right = 1
    for i in range(n - 1, -1, -1):
        ans[i] *= right
        right *= nums[i]

    return ans


# テスト
print(product_except_self([1, 2, 3, 4]))  # [24,12,8,6]
print(product_except_self([-1, 1, 0, -3, 3]))  # [0,0,9,0,0]
print(product_except_self([2, 3]))  # [3,2]
