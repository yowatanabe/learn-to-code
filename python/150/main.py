from typing import List


def threeSum(nums: List[int]) -> List[List[int]]:
    nums.sort()
    res = []
    n = len(nums)

    for i in range(n):
        if i > 0 and nums[i] == nums[i - 1]:
            continue  # 同じ値の重複を避ける
        left, right = i + 1, n - 1

        while left < right:
            total = nums[i] + nums[left] + nums[right]
            if total < 0:
                left += 1
            elif total > 0:
                right -= 1
            else:
                res.append([nums[i], nums[left], nums[right]])
                # 重複をスキップ
                while left < right and nums[left] == nums[left + 1]:
                    left += 1
                while left < right and nums[right] == nums[right - 1]:
                    right -= 1
                left += 1
                right -= 1

    return res


# テスト
print(threeSum([-1, 0, 1, 2, -1, -4]))  # 出力: [[-1, -1, 2], [-1, 0, 1]]
print(threeSum([0, 0, 0]))  # 出力: [[0, 0, 0]]
print(threeSum([0, 1, 1]))  # 出力: []
