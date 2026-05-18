def min_patch_runs(batch_sizes, target):
    INF = 10**9
    dp = [INF] * (target + 1)
    dp[0] = 0

    for total in range(1, target + 1):
        for size in batch_sizes:
            if total - size >= 0:
                dp[total] = min(dp[total], dp[total - size] + 1)

    if dp[target] == INF:
        return -1

    return dp[target]


# 実行例
batch_sizes1 = [1, 3, 4]
target1 = 6

batch_sizes2 = [2, 5]
target2 = 3

batch_sizes3 = [2, 3, 7]
target3 = 14

print(min_patch_runs(batch_sizes1, target1))  # 2
print(min_patch_runs(batch_sizes2, target2))  # -1
print(min_patch_runs(batch_sizes3, target3))  # 2
