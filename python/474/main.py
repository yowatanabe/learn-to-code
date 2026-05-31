from collections import deque


def longest_event_chain(n, relations):
    graph = [[] for _ in range(n)]
    indegree = [0] * n

    for before, after in relations:
        graph[before].append(after)
        indegree[after] += 1

    queue = deque()
    dp = [1] * n  # dp[i]: イベント i で終わる最長連鎖の長さ

    for event in range(n):
        if indegree[event] == 0:
            queue.append(event)

    while queue:
        current = queue.popleft()

        for next_event in graph[current]:
            dp[next_event] = max(dp[next_event], dp[current] + 1)
            indegree[next_event] -= 1

            if indegree[next_event] == 0:
                queue.append(next_event)

    return max(dp)


# 実行例
n1 = 5
relations1 = [[0, 1], [1, 2], [0, 3], [3, 4]]

n2 = 4
relations2 = [[0, 1], [1, 2], [2, 3]]

n3 = 3
relations3 = []

print(longest_event_chain(n1, relations1))  # 3
print(longest_event_chain(n2, relations2))  # 4
print(longest_event_chain(n3, relations3))  # 1
