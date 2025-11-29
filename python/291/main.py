from collections import deque
from typing import List


def num_islands(grid: List[List[str]]) -> int:
    """
    '1' を陸地、'0' を水として、島の数を数える。
    上下左右に隣接する '1' は同じ島とみなす。
    """
    if not grid or not grid[0]:
        return 0

    rows = len(grid)
    cols = len(grid[0])
    visited = [[False] * cols for _ in range(rows)]

    def bfs(start_r: int, start_c: int):
        """(start_r, start_c) から同じ島に属するマスを BFS ですべて訪問する"""
        queue = deque()
        queue.append((start_r, start_c))
        visited[start_r][start_c] = True

        # 上下左右への移動
        directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]

        while queue:
            r, c = queue.popleft()
            for dr, dc in directions:
                nr, nc = r + dr, c + dc
                # グリッド内かどうかチェック
                if 0 <= nr < rows and 0 <= nc < cols:
                    # まだ訪問しておらず、かつ陸地ならキューに追加
                    if not visited[nr][nc] and grid[nr][nc] == "1":
                        visited[nr][nc] = True
                        queue.append((nr, nc))

    count = 0
    for r in range(rows):
        for c in range(cols):
            # 未訪問の陸地を見つけたら、新しい島としてカウントし BFS
            if grid[r][c] == "1" and not visited[r][c]:
                bfs(r, c)
                count += 1

    return count


if __name__ == "__main__":
    # 実行例1
    grid1 = [
        ["1", "1", "1", "1", "0"],
        ["1", "1", "0", "1", "0"],
        ["1", "1", "0", "0", "0"],
        ["0", "0", "0", "0", "0"],
    ]
    print("例1の結果:", num_islands(grid1))  # 1

    # 実行例2
    grid2 = [
        ["1", "1", "0", "0", "0"],
        ["1", "1", "0", "0", "0"],
        ["0", "0", "1", "0", "0"],
        ["0", "0", "0", "1", "1"],
    ]
    print("例2の結果:", num_islands(grid2))  # 3
