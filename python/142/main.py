from typing import List


def three_sum(nums: List[int]) -> List[List[int]]:
    nums.sort()
    result = []
    n = len(nums)

    for i in range(n):
        if i > 0 and nums[i] == nums[i - 1]:
            continue  # 同じ数はスキップ

        left, right = i + 1, n - 1
        while left < right:
            s = nums[i] + nums[left] + nums[right]
            if s < 0:
                left += 1
            elif s > 0:
                right -= 1
            else:
                result.append([nums[i], nums[left], nums[right]])
                # 重複をスキップ
                while left < right and nums[left] == nums[left + 1]:
                    left += 1
                while left < right and nums[right] == nums[right - 1]:
                    right -= 1
                left += 1
                right -= 1
    return result


# テスト
print(three_sum([-1, 0, 1, 2, -1, -4]))
# 出力: [[-1, -1, 2], [-1, 0, 1]]

print(three_sum([0, 1, 1]))
# 出力: []

print(three_sum([0, 0, 0]))
# 出力: [[0, 0, 0]]
