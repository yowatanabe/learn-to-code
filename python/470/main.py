import heapq


def kth_largest_metric(metrics, k):
    heap = []

    for value in metrics:
        heapq.heappush(heap, value)

        if len(heap) > k:
            heapq.heappop(heap)

    return heap[0]


# 実行例
metrics1 = [3, 2, 1, 5, 6, 4]
k1 = 2

metrics2 = [3, 2, 3, 1, 2, 4, 5, 5, 6]
k2 = 4

metrics3 = [10]
k3 = 1

print(kth_largest_metric(metrics1, k1))  # 5
print(kth_largest_metric(metrics2, k2))  # 4
print(kth_largest_metric(metrics3, k3))  # 10
