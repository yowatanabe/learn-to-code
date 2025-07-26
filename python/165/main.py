class Solution:
    def numOfSubarrays(self, nums, k, threshold):
        count = 0
        window_sum = sum(nums[:k])
        if window_sum / k >= threshold:
            count += 1
        for i in range(k, len(nums)):
            window_sum += nums[i] - nums[i - k]
            if window_sum / k >= threshold:
                count += 1
        return count


# テスト
sol = Solution()
print(sol.numOfSubarrays([2, 1, 3, 4, 1, 2, 3, 6], 3, 3))  # 出力: 1
print(sol.numOfSubarrays([1, 1, 1, 1, 1], 1, 1))  # 出力: 5
