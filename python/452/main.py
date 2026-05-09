import heapq


def network_delay_time(n, times, start):
    graph = [[] for _ in range(n)]

    for from_node, to_node, delay in times:
        graph[from_node].append((to_node, delay))

    distances = [float("inf")] * n
    distances[start] = 0

    heap = [(0, start)]

    while heap:
        current_time, node = heapq.heappop(heap)

        if current_time > distances[node]:
            continue

        for next_node, delay in graph[node]:
            new_time = current_time + delay

            if new_time < distances[next_node]:
                distances[next_node] = new_time
                heapq.heappush(heap, (new_time, next_node))

    answer = max(distances)

    if answer == float("inf"):
        return -1

    return answer


# 実行例
n1 = 4
times1 = [[0, 1, 1], [0, 2, 4], [1, 2, 2], [2, 3, 1]]
start1 = 0

n2 = 3
times2 = [[0, 1, 5]]
start2 = 0

n3 = 3
times3 = [[0, 1, 2], [0, 2, 5], [1, 2, 1]]
start3 = 0

print(network_delay_time(n1, times1, start1))  # 4
print(network_delay_time(n2, times2, start2))  # -1
print(network_delay_time(n3, times3, start3))  # 3
