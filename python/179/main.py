def longest_substring_k_distinct(s: str, k: int) -> int:
    from collections import defaultdict

    left = 0
    counts = defaultdict(int)
    distinct = 0
    ans = 0

    for right, ch in enumerate(s):
        counts[ch] += 1
        if counts[ch] == 1:
            distinct += 1

        while distinct > k:
            counts[s[left]] -= 1
            if counts[s[left]] == 0:
                distinct -= 1
            left += 1

        ans = max(ans, right - left + 1)

    return ans


# テスト
print(longest_substring_k_distinct("eceba", 2))  # 3
print(longest_substring_k_distinct("aa", 1))  # 2
print(longest_substring_k_distinct("abcbbbbcccbdddadacb", 2))  # 10
