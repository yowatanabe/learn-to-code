from collections import deque


def find_job_order(numJobs, prerequisites):
    graph = [[] for _ in range(numJobs)]
    indegree = [0] * numJobs

    # グラフ構築
    # [a, b] は「b -> a」
    for a, b in prerequisites:
        graph[b].append(a)
        indegree[a] += 1

    # 入次数0のジョブから開始
    queue = deque()
    for job in range(numJobs):
        if indegree[job] == 0:
            queue.append(job)

    order = []

    while queue:
        current = queue.popleft()
        order.append(current)

        for next_job in graph[current]:
            indegree[next_job] -= 1
            if indegree[next_job] == 0:
                queue.append(next_job)

    # すべて処理できなければ循環依存あり
    if len(order) != numJobs:
        return []

    return order


# 実行例
numJobs1 = 4
prerequisites1 = [[1, 0], [2, 0], [3, 1], [3, 2]]

numJobs2 = 2
prerequisites2 = [[0, 1], [1, 0]]

numJobs3 = 3
prerequisites3 = [[1, 0]]

print(find_job_order(numJobs1, prerequisites1))  # 例: [0, 1, 2, 3]
print(find_job_order(numJobs2, prerequisites2))  # []
print(find_job_order(numJobs3, prerequisites3))  # 例: [0, 2, 1]
