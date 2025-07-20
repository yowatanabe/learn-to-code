from typing import List


class Solution:
    def maxProduct(self, nums: List[int]) -> int:
        if not nums:
            return 0

        max_prod = nums[0]
        curr_max, curr_min = nums[0], nums[0]

        for i in range(1, len(nums)):
            num = nums[i]
            if num < 0:
                curr_max, curr_min = curr_min, curr_max

            curr_max = max(num, curr_max * num)
            curr_min = min(num, curr_min * num)

            max_prod = max(max_prod, curr_max)

        return max_prod


# テスト
s = Solution()
print(s.maxProduct([2, 3, -2, 4]))  # 出力: 6
print(s.maxProduct([-2, 0, -1]))  # 出力: 0
print(s.maxProduct([-2, 3, -4]))  # 出力: 24
