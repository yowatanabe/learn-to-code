def first_unique_char(s: str) -> int:
    from collections import Counter

    count = Counter(s)

    for idx, char in enumerate(s):
        if count[char] == 1:
            return idx
    return -1


# テスト
print(first_unique_char("leetcode"))  # 出力: 0
print(first_unique_char("loveleetcode"))  # 出力: 2
print(first_unique_char("aabb"))  # 出力: -1
