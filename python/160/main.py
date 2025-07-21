from collections import defaultdict
from typing import List


class Solution:
    def subarraySum(self, nums: List[int], k: int) -> int:
        count = 0
        total = 0
        prefix_sums = defaultdict(int)
        prefix_sums[0] = 1

        for num in nums:
            total += num
            count += prefix_sums[total - k]
            prefix_sums[total] += 1

        return count


# テスト
s = Solution()
print(s.subarraySum([1, 1, 1], 2))  # 出力: 2
print(s.subarraySum([1, 2, 3], 3))  # 出力: 2
