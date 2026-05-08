import heapq


def smallest_log_range(streams):
    heap = []
    current_max = float("-inf")

    for stream_index, stream in enumerate(streams):
        value = stream[0]
        heapq.heappush(heap, (value, stream_index, 0))
        current_max = max(current_max, value)

    best_start = heap[0][0]
    best_end = current_max

    while True:
        current_min, stream_index, element_index = heapq.heappop(heap)

        if current_max - current_min < best_end - best_start:
            best_start = current_min
            best_end = current_max

        next_index = element_index + 1

        if next_index == len(streams[stream_index]):
            break

        next_value = streams[stream_index][next_index]
        heapq.heappush(heap, (next_value, stream_index, next_index))
        current_max = max(current_max, next_value)

    return [best_start, best_end]


# 実行例
streams1 = [[4, 10, 15, 24, 26], [0, 9, 12, 20], [5, 18, 22, 30]]

streams2 = [[1, 2, 3], [1, 2, 3], [1, 2, 3]]

streams3 = [[1, 5], [10], [12, 15]]

print(smallest_log_range(streams1))  # [20, 24]
print(smallest_log_range(streams2))  # [1, 1]
print(smallest_log_range(streams3))  # [5, 12]
