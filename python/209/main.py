from collections import defaultdict
from typing import List


def group_anagrams(strs: List[str]) -> List[List[str]]:
    # 26文字の頻度ベクトルをキー（タプル化）にしてグルーピング
    groups = defaultdict(list)
    for s in strs:
        count = [0] * 26
        for ch in s:
            count[ord(ch) - ord("a")] += 1
        groups[tuple(count)].append(s)
    return list(groups.values())


# テスト
print(
    group_anagrams(["eat", "tea", "tan", "ate", "nat", "bat"])
)  # 例: [["eat","tea","ate"],["tan","nat"],["bat"]]
print(group_anagrams([""]))  # [[""]]
print(group_anagrams(["a"]))  # [["a"]]
