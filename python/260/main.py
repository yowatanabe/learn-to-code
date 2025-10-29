import heapq
from collections import Counter
from typing import Any, List


def top_k_frequent_errors(errors: List[Any], K: int) -> List[str]:
    """
    エラーコード列 errors から頻度上位 K 件を返す。
    頻度降順、同頻度は辞書順(文字列比較)昇順。
    返却は文字列型で統一する。
    時間計算量: O(n log K)
    """
    if not errors:
        return []

    # 1) 頻度表
    cnt = Counter(map(str, errors))  # 比較・返却を文字列に統一
    if K <= 0:
        return []

    # 2) 最小ヒープで Top K を保つ
    #    ヒープのキーは (freq, code) で、freq昇順・code昇順（=辞書順）になる
    #    Top K を保ちたいので、サイズが K を超えたら最小要素を落とす
    heap: List[tuple[int, str]] = []
    for code, freq in cnt.items():
        heapq.heappush(heap, (freq, code))
        if len(heap) > K:
            heapq.heappop(heap)

    # 3) ヒープには上位Kが「最小ヒープ順」で入っている
    #    要求は「頻度降順、同頻度は辞書順昇順」なので並べ替える
    top = list(heap)
    top.sort(key=lambda x: (-x[0], x[1]))  # freq降順、code昇順
    return [code for _, code in top]


print(top_k_frequent_errors(["500", "404", "500", "503", "404", "500"], 2))
print(top_k_frequent_errors(["a", "b", "c", "b", "c"], 2))
print(top_k_frequent_errors([1, 2, 3, 1, 2, 1], 1))
print(top_k_frequent_errors([], 1))
