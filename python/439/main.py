def minimum_connection_cost(n, connections):
    parent = list(range(n))
    rank = [0] * n

    def find(x):
        if parent[x] != x:
            parent[x] = find(parent[x])
        return parent[x]

    def union(a, b):
        root_a = find(a)
        root_b = find(b)

        if root_a == root_b:
            return False

        if rank[root_a] < rank[root_b]:
            parent[root_a] = root_b
        elif rank[root_a] > rank[root_b]:
            parent[root_b] = root_a
        else:
            parent[root_b] = root_a
            rank[root_a] += 1

        return True

    connections.sort(key=lambda x: x[2])

    total_cost = 0
    edge_count = 0

    for a, b, cost in connections:
        if union(a, b):
            total_cost += cost
            edge_count += 1

            if edge_count == n - 1:
                return total_cost

    return -1


# 実行例
n1 = 4
connections1 = [
    [0, 1, 1],
    [1, 2, 2],
    [0, 2, 4],
    [2, 3, 1]
]

n2 = 3
connections2 = [
    [0, 1, 5]
]

n3 = 3
connections3 = [
    [0, 1, 10],
    [1, 2, 1],
    [0, 2, 3]
]

print(minimum_connection_cost(n1, connections1))  # 4
print(minimum_connection_cost(n2, connections2))  # -1
print(minimum_connection_cost(n3, connections3))  # 4
