def min_incident_response_cost(costs):
    n = len(costs)

    if n == 1:
        return costs[0]

    prev2 = costs[0]
    prev1 = costs[1]

    for i in range(2, n):
        current = costs[i] + min(prev1, prev2)
        prev2 = prev1
        prev1 = current

    return min(prev1, prev2)


# 実行例
costs1 = [10, 15, 20]
costs2 = [1, 100, 1, 1, 1, 100, 1, 1, 100, 1]
costs3 = [5, 5, 10, 1]

print(min_incident_response_cost(costs1))  # 15
print(min_incident_response_cost(costs2))  # 5
print(min_incident_response_cost(costs3))  # 6
