def min_agent_cost(costs):
    n = len(costs)

    if n == 1:
        return costs[0]

    INF = 10**18

    # dp0: 現在のサーバーにエージェントを置く
    # dp1: 現在のサーバーには置かないが、左隣により監視されている
    # dp2: 現在のサーバーには置かず、まだ監視されていない
    dp0 = costs[0]
    dp1 = INF
    dp2 = 0

    for i in range(1, n):
        new_dp0 = min(dp0, dp1, dp2) + costs[i]
        new_dp1 = dp0
        new_dp2 = dp1

        dp0, dp1, dp2 = new_dp0, new_dp1, new_dp2

    # 最後のサーバーが未監視の状態 dp2 は不可
    return min(dp0, dp1)


# 実行例
costs1 = [5, 1, 4]
costs2 = [3, 2, 10, 1, 4]
costs3 = [8, 6, 7, 5]

print(min_agent_cost(costs1))  # 1
print(min_agent_cost(costs2))  # 3
print(min_agent_cost(costs3))  # 11
