from collections import deque


def can_start_all_services(n, dependencies):
    graph = [[] for _ in range(n)]
    indegree = [0] * n

    # [service, depends_on] は depends_on -> service
    for service, depends_on in dependencies:
        graph[depends_on].append(service)
        indegree[service] += 1

    queue = deque()

    for service in range(n):
        if indegree[service] == 0:
            queue.append(service)

    started_count = 0

    while queue:
        current = queue.popleft()
        started_count += 1

        for next_service in graph[current]:
            indegree[next_service] -= 1
            if indegree[next_service] == 0:
                queue.append(next_service)

    return started_count == n


# 実行例
n1 = 4
dependencies1 = [[1, 0], [2, 1], [3, 2]]

n2 = 3
dependencies2 = [[0, 1], [1, 2], [2, 0]]

n3 = 3
dependencies3 = [[1, 0]]

print(can_start_all_services(n1, dependencies1))  # True
print(can_start_all_services(n2, dependencies2))  # False
print(can_start_all_services(n3, dependencies3))  # True
