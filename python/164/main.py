class Solution:
    def maxProduct(self, nums):
        first = second = 0
        for n in nums:
            if n > first:
                second = first
                first = n
            elif n > second:
                second = n
        return (first - 1) * (second - 1)


# テスト
sol = Solution()
print(sol.maxProduct([3, 4, 5, 2]))  # 出力: 12
print(sol.maxProduct([1, 5, 4, 5]))  # 出力: 16
print(sol.maxProduct([10, 2, 5, 2]))  # 出力: 36
