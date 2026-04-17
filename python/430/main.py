def count_server_groups(connections):
    n = len(connections)
    visited = set()
    group_count = 0

    def dfs(server):
        for neighbor in range(n):
            if connections[server][neighbor] == 1 and neighbor not in visited:
                visited.add(neighbor)
                dfs(neighbor)

    for server in range(n):
        if server not in visited:
            visited.add(server)
            dfs(server)
            group_count += 1

    return group_count


# 実行例
connections1 = [
    [1, 1, 0],
    [1, 1, 0],
    [0, 0, 1]
]

connections2 = [
    [1, 0, 0, 1],
    [0, 1, 1, 0],
    [0, 1, 1, 0],
    [1, 0, 0, 1]
]

connections3 = [
    [1, 0, 0],
    [0, 1, 0],
    [0, 0, 1]
]

print(count_server_groups(connections1))  # 2
print(count_server_groups(connections2))  # 2
print(count_server_groups(connections3))  # 3
