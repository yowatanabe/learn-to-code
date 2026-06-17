from collections import deque


def deployment_order(n, relations):
    graph = [[] for _ in range(n)]
    indegree = [0] * n

    for before, after in relations:
        graph[before].append(after)
        indegree[after] += 1

    queue = deque()

    for service in range(n):
        if indegree[service] == 0:
            queue.append(service)

    order = []

    while queue:
        current = queue.popleft()
        order.append(current)

        for next_service in graph[current]:
            indegree[next_service] -= 1
            if indegree[next_service] == 0:
                queue.append(next_service)

    if len(order) != n:
        return []

    return order


# 実行例
n1 = 4
relations1 = [[0, 1], [0, 2], [1, 3], [2, 3]]

n2 = 2
relations2 = [[0, 1], [1, 0]]

n3 = 3
relations3 = [[1, 2]]

print(deployment_order(n1, relations1))  # [0, 1, 2, 3]
print(deployment_order(n2, relations2))  # []
print(deployment_order(n3, relations3))  # [0, 1, 2]
