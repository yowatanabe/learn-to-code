def first_unique_char(s: str) -> str:
    from collections import Counter

    count = Counter(s)
    for ch in s:
        if count[ch] == 1:
            return ch
    return "_"


# テスト
print(first_unique_char("leetcode"))  # 出力: "l"
print(first_unique_char("aabb"))  # 出力: "_"
print(first_unique_char("swiss"))  # 出力: "w"
