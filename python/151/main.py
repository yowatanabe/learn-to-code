def longestPalindrome(s: str) -> str:
    def expand_around_center(left: int, right: int) -> str:
        while left >= 0 and right < len(s) and s[left] == s[right]:
            left -= 1
            right += 1
        return s[left + 1 : right]

    longest = ""
    for i in range(len(s)):
        # 奇数長の回文
        temp1 = expand_around_center(i, i)
        # 偶数長の回文
        temp2 = expand_around_center(i, i + 1)
        if len(temp1) > len(longest):
            longest = temp1
        if len(temp2) > len(longest):
            longest = temp2
    return longest


# テスト
print(longestPalindrome("babad"))  # 出力: "bab"
print(longestPalindrome("cbbd"))  # 出力: "bb"
print(longestPalindrome("a"))  # 出力: "a"
print(longestPalindrome("ac"))  # 出力: "a"
