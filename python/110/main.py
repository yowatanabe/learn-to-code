def is_anagram(s, t):
    return sorted(s) == sorted(t)


# テスト
print(is_anagram("anagram", "nagaram"))  # True
print(is_anagram("rat", "car"))  # False
print(is_anagram("listen", "silent"))  # True
