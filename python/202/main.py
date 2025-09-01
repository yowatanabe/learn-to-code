import heapq
from typing import List


def k_closest(points: List[List[int]], k: int) -> List[List[int]]:
    # O(n log k) 解法：最大ヒープ（Pythonでは負値を使って擬似最大ヒープ）
    # ヒープには (距離二乗の負値, x, y) を push し、サイズが k を超えたら pop
    heap = []
    for x, y in points:
        dist2 = x * x + y * y
        heapq.heappush(heap, (-dist2, x, y))
        if len(heap) > k:
            heapq.heappop(heap)  # 最も遠い点（負が最小=実距離が最大）を捨てる
    return [[x, y] for _, x, y in heap]


# テスト
print(k_closest([[1, 3], [-2, 2]], 1))  # [[-2,2]]
print(k_closest([[3, 3], [5, -1], [-2, 4]], 2))  # [[3,3],[-2,4]] など順不同
print(k_closest([[0, 1], [1, 0], [2, 2], [0, 0]], 3))  # [[0,0],[0,1],[1,0]] など
