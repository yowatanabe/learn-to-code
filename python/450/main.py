import heapq


def min_workers(tasks):
    tasks.sort(key=lambda x: x[0])

    heap = []  # 現在作業中の終了時刻を入れる

    for start, end in tasks:
        # 最も早く終わる作業者が空いていれば再利用する
        if heap and heap[0] <= start:
            heapq.heappop(heap)

        heapq.heappush(heap, end)

    return len(heap)


# 実行例
tasks1 = [[1, 4], [2, 5], [7, 9]]
tasks2 = [[1, 3], [3, 5], [5, 7]]
tasks3 = [[1, 10], [2, 3], [4, 5], [6, 7]]

print(min_workers(tasks1))  # 2
print(min_workers(tasks2))  # 1
print(min_workers(tasks3))  # 2
