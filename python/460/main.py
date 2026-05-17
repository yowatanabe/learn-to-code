import heapq


def max_success_probability(n, edges, probabilities, start, goal):
    graph = [[] for _ in range(n)]

    for (a, b), p in zip(edges, probabilities):
        graph[a].append((b, p))
        graph[b].append((a, p))

    best = [0.0] * n
    best[start] = 1.0

    # Python の heapq は最小ヒープなので、確率をマイナスにして最大ヒープのように使う
    heap = [(-1.0, start)]

    while heap:
        neg_prob, node = heapq.heappop(heap)
        current_prob = -neg_prob

        if node == goal:
            return current_prob

        if current_prob < best[node]:
            continue

        for next_node, edge_prob in graph[node]:
            new_prob = current_prob * edge_prob

            if new_prob > best[next_node]:
                best[next_node] = new_prob
                heapq.heappush(heap, (-new_prob, next_node))

    return 0.0


# 実行例
n1 = 3
edges1 = [[0, 1], [1, 2], [0, 2]]
probabilities1 = [0.5, 0.5, 0.2]
start1 = 0
goal1 = 2

n2 = 3
edges2 = [[0, 1]]
probabilities2 = [0.5]
start2 = 0
goal2 = 2

n3 = 4
edges3 = [[0, 1], [1, 2], [2, 3], [0, 3]]
probabilities3 = [0.9, 0.9, 0.9, 0.5]
start3 = 0
goal3 = 3

print(max_success_probability(n1, edges1, probabilities1, start1, goal1))  # 0.25
print(max_success_probability(n2, edges2, probabilities2, start2, goal2))  # 0.0
print(max_success_probability(n3, edges3, probabilities3, start3, goal3))  # 0.729
