from typing import List


class Solution:
    def maxProduct(self, nums: List[int]) -> int:
        if not nums:
            return 0

        max_prod = nums[0]
        min_prod = nums[0]
        result = nums[0]

        for i in range(1, len(nums)):
            current = nums[i]
            temp_max = max(current, max_prod * current, min_prod * current)
            min_prod = min(current, max_prod * current, min_prod * current)
            max_prod = temp_max
            result = max(result, max_prod)

        return result


# テスト
sol = Solution()
print(sol.maxProduct([2, 3, -2, 4]))
print(sol.maxProduct([-2, 0, -1]))
print(sol.maxProduct([-2, 3, -4]))
