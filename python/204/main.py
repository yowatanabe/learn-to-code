from typing import List


def partition_labels(s: str) -> List[int]:
    # 各文字の「最後の出現位置」を記録
    last = {ch: i for i, ch in enumerate(s)}
    res = []
    start = end = 0

    for i, ch in enumerate(s):
        end = max(end, last[ch])  # 現在の区間がこの文字の最終位置まで少なくとも伸びる
        if i == end:
            # 現在の区間を閉じられる（ここまでで含まれる全文字の最終出現をカバー）
            res.append(end - start + 1)
            start = i + 1

    return res


# テスト
print(partition_labels("ababcbacadefegdehijhklij"))  # [9,7,8]
print(partition_labels("eccbbbbdec"))  # [10]
print(partition_labels("caedbdedda"))  # [1,9]
