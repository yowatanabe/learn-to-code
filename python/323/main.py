from typing import List, Tuple
import heapq


def k_smallest_pairs(
    nums1: List[int], nums2: List[int], k: int
) -> List[Tuple[int, int]]:
    if not nums1 or not nums2 or k <= 0:
        return []

    n1, n2 = len(nums1), len(nums2)
    res = []

    # (sum, i, j)
    heap = []
    # nums1 の先頭側だけで十分（k個以上は不要）
    for i in range(min(k, n1)):
        heapq.heappush(heap, (nums1[i] + nums2[0], i, 0))

    while heap and len(res) < k:
        _, i, j = heapq.heappop(heap)
        res.append((nums1[i], nums2[j]))

        # 同じ i で j を進める
        if j + 1 < n2:
            heapq.heappush(heap, (nums1[i] + nums2[j + 1], i, j + 1))

    return res


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        ([1, 7, 11], [2, 4, 6], 3),
        ([1, 1, 2], [1, 2, 3], 2),
        ([1, 2], [3], 5),
    ]

    for idx, (a, b, k) in enumerate(cases, start=1):
        print(f"例{idx} 入力: nums1={a}, nums2={b}, k={k}")
        print(f"例{idx} 出力: {k_smallest_pairs(a, b, k)}")
        print("-" * 40)
