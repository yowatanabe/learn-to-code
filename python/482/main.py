def service_group_sizes(n, connections):
    parent = list(range(n))
    size = [1] * n

    def find(x):
        if parent[x] != x:
            parent[x] = find(parent[x])
        return parent[x]

    def union(a, b):
        root_a = find(a)
        root_b = find(b)

        if root_a == root_b:
            return

        if size[root_a] < size[root_b]:
            root_a, root_b = root_b, root_a

        parent[root_b] = root_a
        size[root_a] += size[root_b]

    for a, b in connections:
        union(a, b)

    result = []
    for service in range(n):
        root = find(service)
        result.append(size[root])

    return result


# 実行例
n1 = 5
connections1 = [[0, 1], [1, 2], [3, 4]]

n2 = 4
connections2 = []

n3 = 6
connections3 = [[0, 5], [1, 2], [2, 3], [3, 4]]

print(service_group_sizes(n1, connections1))  # [3, 3, 3, 2, 2]
print(service_group_sizes(n2, connections2))  # [1, 1, 1, 1]
print(service_group_sizes(n3, connections3))  # [2, 4, 4, 4, 4, 2]
