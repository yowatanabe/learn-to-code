from collections import defaultdict


def group_anagrams(strs):
    groups = defaultdict(list)
    for s in strs:
        key = tuple(sorted(s))
        groups[key].append(s)
    return list(groups.values())


# テスト
print(group_anagrams(["eat", "tea", "tan", "ate", "nat", "bat"]))
# 出力例: [["eat", "tea", "ate"], ["tan", "nat"], ["bat"]]

print(group_anagrams([""]))
# 出力: [[""]]

print(group_anagrams(["a"]))
# 出力: [["a"]]
