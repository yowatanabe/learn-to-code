def can_reorganize(s):
    from collections import Counter

    n = len(s)
    counts = Counter(s)
    max_count = max(counts.values())
    # 最頻文字の個数が (他の文字数+1) より大きければ実現不可能
    return max_count <= (n + 1) // 2


# テスト例
print(can_reorganize("aab"))  # True
print(can_reorganize("aaab"))  # False
print(can_reorganize("abcabc"))  # True
