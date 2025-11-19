from typing import List


def count_islands(grid: List[List[str]]) -> int:
    """
    '1' を障害セル、'0' を正常セルとみなしたとき、
    上下左右で連結な '1' の塊（島）の数を数える。

    アルゴリズム:
      - 全セルを走査し、まだ訪問していない '1' を見つけたら、
        そこから DFS/BFS で同じ島に属する '1' をすべて訪問済みにする。
      - 島を1つ見つけるごとにカウンタを +1。
      - 訪問済み管理は、別配列 visited を使うか、
        grid を直接 '0' に書き換える方式でもよい。
      - ここでは grid を直接書き換える DFS 実装でいく。

    時間計算量: O(R*C)
    空間計算量: O(R*C) (再帰スタック含む最悪ケース)
    """

    if not grid or not grid[0]:
        return 0

    rows = len(grid)
    cols = len(grid[0])

    def dfs(r: int, c: int) -> None:
        # グリッド範囲外 or '0' なら何もしない
        if r < 0 or r >= rows or c < 0 or c >= cols:
            return
        if grid[r][c] != "1":
            return

        # 現在セルを訪問済みとして '0' に変える
        grid[r][c] = "0"

        # 上下左右に再帰
        dfs(r - 1, c)  # 上
        dfs(r + 1, c)  # 下
        dfs(r, c - 1)  # 左
        dfs(r, c + 1)  # 右

    islands = 0

    for r in range(rows):
        for c in range(cols):
            if grid[r][c] == "1":
                # 新しい島の開始点を見つけた
                islands += 1
                dfs(r, c)

    return islands


# 要求どおり print で結果をアウトプットする部分
if __name__ == "__main__":
    # 例1
    grid1 = [
        ["1", "1", "0", "0", "0"],
        ["1", "1", "0", "0", "0"],
        ["0", "0", "1", "0", "0"],
        ["0", "0", "0", "1", "1"],
    ]
    print(count_islands([row[:] for row in grid1]))  # 3

    # 例2
    grid2 = [["1", "1", "1"], ["0", "1", "0"], ["1", "1", "1"]]
    print(count_islands([row[:] for row in grid2]))  # 1

    # 例3
    grid3 = [["0", "0", "0"], ["0", "0", "0"]]
    print(count_islands([row[:] for row in grid3]))  # 0

    # 例4
    grid4 = [["1"]]
    print(count_islands([row[:] for row in grid4]))  # 1
