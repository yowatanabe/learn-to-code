def min_config_edit_distance(old_config, new_config):
    n = len(old_config)
    m = len(new_config)

    dp = [[0] * (m + 1) for _ in range(n + 1)]

    for i in range(n + 1):
        dp[i][0] = i

    for j in range(m + 1):
        dp[0][j] = j

    for i in range(1, n + 1):
        for j in range(1, m + 1):
            if old_config[i - 1] == new_config[j - 1]:
                dp[i][j] = dp[i - 1][j - 1]
            else:
                insert_cost = dp[i][j - 1] + 1
                delete_cost = dp[i - 1][j] + 1
                replace_cost = dp[i - 1][j - 1] + 1

                dp[i][j] = min(insert_cost, delete_cost, replace_cost)

    return dp[n][m]


# 実行例
old_config1 = "horse"
new_config1 = "ros"

old_config2 = "intention"
new_config2 = "execution"

old_config3 = "same"
new_config3 = "same"

print(min_config_edit_distance(old_config1, new_config1))  # 3
print(min_config_edit_distance(old_config2, new_config2))  # 5
print(min_config_edit_distance(old_config3, new_config3))  # 0
