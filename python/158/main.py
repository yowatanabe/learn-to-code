from collections import defaultdict


def longest_substring_with_one_swap(s):
    max_len = 0
    count = defaultdict(int)
    left = 0
    max_count = 0

    for right in range(len(s)):
        count[s[right]] += 1
        max_count = max(max_count, count[s[right]])

        # 窓のサイズから最大出現数を引いた値が1を超えたら左を縮める
        if (right - left + 1) - max_count > 1:
            count[s[left]] -= 1
            left += 1

        max_len = max(max_len, right - left + 1)

    return max_len


# 実行例
print(longest_substring_with_one_swap("ababa"))  # 3
print(longest_substring_with_one_swap("aaabbaaa"))  # 6
print(longest_substring_with_one_swap("abcde"))  # 2
