from collections import deque


def shortest_alert_route(n, routes, start, goal):
    graph = [[] for _ in range(n)]

    for from_node, to_node in routes:
        graph[from_node].append(to_node)

    queue = deque([(start, 0)])
    visited = set([start])

    while queue:
        current, distance = queue.popleft()

        if current == goal:
            return distance

        for next_node in graph[current]:
            if next_node not in visited:
                visited.add(next_node)
                queue.append((next_node, distance + 1))

    return -1


# 実行例
n1 = 5
routes1 = [[0, 1], [0, 2], [1, 3], [2, 3], [3, 4]]
start1 = 0
goal1 = 4

n2 = 4
routes2 = [[0, 1], [1, 2]]
start2 = 0
goal2 = 3

n3 = 3
routes3 = [[0, 1], [1, 2]]
start3 = 2
goal3 = 2

print(shortest_alert_route(n1, routes1, start1, goal1))  # 3
print(shortest_alert_route(n2, routes2, start2, goal2))  # -1
print(shortest_alert_route(n3, routes3, start3, goal3))  # 0
