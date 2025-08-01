def character_replacement(s, k):
    from collections import defaultdict

    max_len = 0
    count = defaultdict(int)
    left = 0
    max_count = 0

    for right in range(len(s)):
        count[s[right]] += 1
        max_count = max(max_count, count[s[right]])

        while (right - left + 1) - max_count > k:
            count[s[left]] -= 1
            left += 1
        max_len = max(max_len, right - left + 1)

    return max_len


# テスト例
print(character_replacement("AABABBA", 1))  # 4
print(character_replacement("ABAB", 2))  # 4
print(character_replacement("ABAA", 0))  # 2
