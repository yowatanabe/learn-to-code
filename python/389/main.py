from typing import List
from collections import defaultdict

def group_anagrams(tags: List[str]) -> List[List[str]]:
    """
    各文字列をソートしたものをキーにしてグループ化する。

    例:
      "eat" -> "aet"
      "tea" -> "aet"
      "ate" -> "aet"

    同じキーを持つもの同士を同じグループに入れる。

    計算量:
      文字列1個あたり O(k log k)
      k = 文字列長
    """
    groups = defaultdict(list)

    for tag in tags:
        key = "".join(sorted(tag))
        groups[key].append(tag)

    return list(groups.values())


if __name__ == "__main__":
    print(group_anagrams(["eat", "tea", "tan", "ate", "nat", "bat"]))
    # [['eat', 'tea', 'ate'], ['tan', 'nat'], ['bat']]

    print(group_anagrams([""]))
    # [['']]

    print(group_anagrams(["a"]))
    # [['a']]
