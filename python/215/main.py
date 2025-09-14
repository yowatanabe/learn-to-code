from typing import List


def unique_paths_with_obstacles(obstacleGrid: List[List[int]]) -> int:
    m, n = len(obstacleGrid), len(obstacleGrid[0])

    # スタートやゴールが障害物なら即0
    if obstacleGrid[0][0] == 1 or obstacleGrid[m - 1][n - 1] == 1:
        return 0

    # 1行ぶんのDPでメモリO(n)
    dp = [0] * n
    dp[0] = 1  # スタート地点

    for i in range(m):
        for j in range(n):
            if obstacleGrid[i][j] == 1:
                dp[j] = 0  # 障害物セルは経路なし
            else:
                if j > 0:
                    dp[j] += dp[j - 1]  # 左(dp[j-1]) + 上(dp[j])
    return dp[-1]


# テスト
print(unique_paths_with_obstacles([[0, 0, 0], [0, 1, 0], [0, 0, 0]]))  # 2
print(unique_paths_with_obstacles([[0, 1], [0, 0]]))  # 1
print(unique_paths_with_obstacles([[1, 0], [0, 0]]))  # 0
