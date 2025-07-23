class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        seen = set()
        left = 0
        max_len = 0

        for right in range(len(s)):
            while s[right] in seen:
                seen.remove(s[left])
                left += 1
            seen.add(s[right])
            max_len = max(max_len, right - left + 1)

        return max_len


# テスト
sol = Solution()
print(sol.lengthOfLongestSubstring("abcabcbb"))  # 出力: 3
print(sol.lengthOfLongestSubstring("bbbbb"))  # 出力: 1
print(sol.lengthOfLongestSubstring("pwwkew"))  # 出力: 3
