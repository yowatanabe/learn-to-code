from collections import deque


def count_server_groups_grid(grid):
    rows = len(grid)
    cols = len(grid[0])
    count = 0

    def bfs(start_r, start_c):
        queue = deque([(start_r, start_c)])
        grid[start_r][start_c] = "0"

        while queue:
            r, c = queue.popleft()

            for dr, dc in [(1, 0), (-1, 0), (0, 1), (0, -1)]:
                nr = r + dr
                nc = c + dc

                if 0 <= nr < rows and 0 <= nc < cols and grid[nr][nc] == "1":
                    grid[nr][nc] = "0"
                    queue.append((nr, nc))

    for r in range(rows):
        for c in range(cols):
            if grid[r][c] == "1":
                count += 1
                bfs(r, c)

    return count


# 実行例
grid1 = [["1", "1", "0", "0"], ["1", "0", "0", "1"], ["0", "0", "1", "1"]]

grid2 = [["1", "1", "1"], ["0", "1", "0"], ["1", "0", "1"]]

grid3 = [["0", "0"], ["0", "0"]]

print(count_server_groups_grid(grid1))  # 2
print(count_server_groups_grid(grid2))  # 3
print(count_server_groups_grid(grid3))  # 0
