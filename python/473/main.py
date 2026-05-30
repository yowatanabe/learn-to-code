import heapq


def min_notification_time(n, edges, start):
    graph = [[] for _ in range(n)]

    for from_node, to_node, delay in edges:
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
edges1 = [[0, 1, 1], [0, 2, 4], [1, 2, 2], [2, 3, 1]]
start1 = 0

n2 = 3
edges2 = [[0, 1, 5]]
start2 = 0

n3 = 1
edges3 = []
start3 = 0

print(min_notification_time(n1, edges1, start1))  # 4
print(min_notification_time(n2, edges2, start2))  # -1
print(min_notification_time(n3, edges3, start3))  # 0
