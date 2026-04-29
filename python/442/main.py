def min_restart_cost(costs, k):
    current_sum = sum(costs[:k])
    min_sum = current_sum

    for right in range(k, len(costs)):
        current_sum += costs[right]
        current_sum -= costs[right - k]
        min_sum = min(min_sum, current_sum)

    return min_sum


# 実行例
costs1 = [5, 2, 4, 1, 3]
k1 = 2

costs2 = [10, 20, 30]
k2 = 3

costs3 = [3, 1, 2, 8, 1, 1]
k3 = 3

print(min_restart_cost(costs1, k1))  # 4
print(min_restart_cost(costs2, k2))  # 60
print(min_restart_cost(costs3, k3))  # 6
