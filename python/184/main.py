import heapq
from collections import Counter


def top_k_frequent(nums: list[int], k: int) -> list[int]:
    # 要素の出現回数をカウント
    freq = Counter(nums)  # 例: {1:3, 2:2, 3:1}

    # 最小ヒープを使って上位kを維持（(頻度, 値)で格納）
    heap = []
    for val, cnt in freq.items():
        if len(heap) < k:
            heapq.heappush(heap, (cnt, val))
        else:
            # ヒープ最小（=現在の上位kの中で最も頻度が低い）より大きければ置き換え
            if cnt > heap[0][0]:
                heapq.heapreplace(heap, (cnt, val))

    # ヒープから値だけ取り出す
    return [val for _, val in heap]


# テスト
print(top_k_frequent([1, 1, 1, 2, 2, 3], 2))  # [1,2]（順不同）
print(top_k_frequent([4, 4, 4, 6, 6, 7], 1))  # [4]
print(top_k_frequent([1], 1))  # [1]
