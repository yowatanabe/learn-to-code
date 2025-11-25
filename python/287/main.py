from collections import defaultdict


def group_anagrams(strs):
    """
    アナグラム同士をグループ化して返す。
    キーとして「ソートした文字列」を使う典型解法。
    """
    groups = defaultdict(list)

    for s in strs:
        # 文字をソートしてアナグラム共通のキーを作る
        # 例: "eat" -> "aet", "tea" -> "aet"
        key = "".join(sorted(s))
        groups[key].append(s)

    # dict の values をリストにして返す
    return list(groups.values())


if __name__ == "__main__":
    # 実行例1
    strs1 = ["eat", "tea", "tan", "ate", "nat", "bat"]
    result1 = group_anagrams(strs1)
    print("例1の入力:", strs1)
    print("例1の結果:", result1)

    # 実行例2
    strs2 = ["a"]
    result2 = group_anagrams(strs2)
    print("例2の入力:", strs2)
    print("例2の結果:", result2)

    # 実行例3
    strs3 = [""]
    result3 = group_anagrams(strs3)
    print("例3の入力:", strs3)
    print("例3の結果:", result3)
