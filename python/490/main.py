from collections import deque


def minutes_until_all_failed(grid):
    rows = len(grid)
    cols = len(grid[0])

    queue = deque()
    normal_count = 0

    for r in range(rows):
        for c in range(cols):
            if grid[r][c] == 2:
                queue.append((r, c, 0))
            elif grid[r][c] == 1:
                normal_count += 1

    minutes = 0
    directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]

    while queue:
        r, c, time = queue.popleft()
        minutes = max(minutes, time)

        for dr, dc in directions:
            nr = r + dr
            nc = c + dc

            if 0 <= nr < rows and 0 <= nc < cols and grid[nr][nc] == 1:
                grid[nr][nc] = 2
                normal_count -= 1
                queue.append((nr, nc, time + 1))

    if normal_count > 0:
        return -1

    return minutes


# 実行例
grid1 = [
    [2, 1, 1],
    [1, 1, 0],
    [0, 1, 1]
]

grid2 = [
    [2, 1, 1],
    [0, 1, 1],
    [1, 0, 1]
]

grid3 = [
    [0, 2]
]

print(minutes_until_all_failed(grid1))  # 4
print(minutes_until_all_failed(grid2))  # -1
print(minutes_until_all_failed(grid3))  # 0
