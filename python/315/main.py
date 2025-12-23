import heapq
from collections import Counter
from typing import List


def top_k_frequent(nums: List[int], k: int) -> List[int]:
    freq = Counter(nums)

    # (count, num) の min-heap を作り、サイズ k を維持
    heap = []
    for num, count in freq.items():
        heapq.heappush(heap, (count, num))
        if len(heap) > k:
            heapq.heappop(heap)

    # heap には上位 k が残っている（順序は問わない）
    return [num for _, num in heap]


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        ([1, 1, 1, 2, 2, 3], 2),
        ([1], 1),
        ([4, 4, 4, 6, 6, 7, 7, 7, 7], 2),
    ]

    for i, (nums, k) in enumerate(cases, start=1):
        print(f"例{i} 入力: nums={nums}, k={k}")
        print(f"例{i} 出力: {top_k_frequent(nums, k)}")
        print("-" * 40)
