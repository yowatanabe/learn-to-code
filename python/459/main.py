def min_edit_distance(current, target):
    n = len(current)
    m = len(target)

    dp = [[0] * (m + 1) for _ in range(n + 1)]

    for i in range(n + 1):
        dp[i][0] = i

    for j in range(m + 1):
        dp[0][j] = j

    for i in range(1, n + 1):
        for j in range(1, m + 1):
            if current[i - 1] == target[j - 1]:
                dp[i][j] = dp[i - 1][j - 1]
            else:
                insert_cost = dp[i][j - 1] + 1
                delete_cost = dp[i - 1][j] + 1
                replace_cost = dp[i - 1][j - 1] + 1

                dp[i][j] = min(insert_cost, delete_cost, replace_cost)

    return dp[n][m]


# 実行例
current1 = "server"
target1 = "service"

current2 = "log"
target2 = "log"

current3 = "db"
target3 = "database"

print(min_edit_distance(current1, target1))  # 4
print(min_edit_distance(current2, target2))  # 0
print(min_edit_distance(current3, target3))  # 6
