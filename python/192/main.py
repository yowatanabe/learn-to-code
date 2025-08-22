def length_of_longest_substring(s: str) -> int:
    last = {}  # 文字 -> 直近のインデックス
    left = 0
    ans = 0
    for right, ch in enumerate(s):
        # ch が現在ウィンドウ内に再登場したら、left をジャンプ
        if ch in last and last[ch] >= left:
            left = last[ch] + 1
        last[ch] = right
        ans = max(ans, right - left + 1)
    return ans


# テスト
print(length_of_longest_substring("abcabcbb"))  # 3
print(length_of_longest_substring("bbbbb"))  # 1
print(length_of_longest_substring("pwwkew"))  # 3
print(length_of_longest_substring(""))  # 0
