def min_insert_delete_operations(start, target):
    n = len(start)
    m = len(target)

    # dp[i][j]: start の先頭 i 文字と target の先頭 j 文字の LCS 長
    dp = [[0] * (m + 1) for _ in range(n + 1)]

    for i in range(1, n + 1):
        for j in range(1, m + 1):
            if start[i - 1] == target[j - 1]:
                dp[i][j] = dp[i - 1][j - 1] + 1
            else:
                dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])

    lcs = dp[n][m]

    # start から LCS 以外を削除し、target に足りない文字を追加する
    return (n - lcs) + (m - lcs)


# 実行例
start1 = "deploy"
target1 = "debug"

start2 = "config"
target2 = "config"

start3 = "abc"
target3 = "yabd"

print(min_insert_delete_operations(start1, target1))  # 7
print(min_insert_delete_operations(start2, target2))  # 0
print(min_insert_delete_operations(start3, target3))  # 3
