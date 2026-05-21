def min_log_retention_cost(costs):
    n = len(costs)

    # n が 1 または 2 の場合、連続する3日間が存在しないため保存不要
    if n < 3:
        return 0

    INF = 10**18

    # dp0: 現在の日を保存する
    # dp1: 現在の日は保存しないが、直前の日を保存している
    # dp2: 現在の日も直前の日も保存していない
    dp0 = costs[0]
    dp1 = INF
    dp2 = 0

    for i in range(1, n):
        new_dp0 = min(dp0, dp1, dp2) + costs[i]
        new_dp1 = dp0
        new_dp2 = dp1

        dp0, dp1, dp2 = new_dp0, new_dp1, new_dp2

    # 最後に dp2 でもよい
    # なぜなら「最後の2日が未保存」でも、3日連続未保存でなければ条件違反ではない
    return min(dp0, dp1, dp2)


# 実行例
costs1 = [5, 1, 2, 10, 1]
costs2 = [3, 2, 4]
costs3 = [1, 100, 100, 1]

print(min_log_retention_cost(costs1))  # 2
print(min_log_retention_cost(costs2))  # 2
print(min_log_retention_cost(costs3))  # 2
