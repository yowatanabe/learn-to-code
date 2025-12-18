from collections import defaultdict
from typing import Dict, List, Tuple


def group_anagrams(strs: List[str]) -> List[List[str]]:
    """
    アナグラム同士をグループ化して返す。
    文字頻度(26個)をキーにすることで O(N*L)。
    """
    groups: Dict[Tuple[int, ...], List[str]] = defaultdict(list)

    for s in strs:
        count = [0] * 26
        for ch in s:
            count[ord(ch) - ord("a")] += 1
        groups[tuple(count)].append(s)

    return list(groups.values())


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        ["eat", "tea", "tan", "ate", "nat", "bat"],
        [""],
        ["a"],
    ]

    for i, strs in enumerate(cases, start=1):
        print(f"例{i} 入力: {strs}")
        print(f"例{i} 出力: {group_anagrams(strs)}")
        print("-" * 40)
