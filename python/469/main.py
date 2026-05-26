def minimize_max_load(loads, k):
    def can_split(max_allowed):
        groups = 1
        current_sum = 0

        for load in loads:
            if current_sum + load <= max_allowed:
                current_sum += load
            else:
                groups += 1
                current_sum = load

        return groups <= k

    left = max(loads)
    right = sum(loads)

    while left < right:
        mid = (left + right) // 2

        if can_split(mid):
            right = mid
        else:
            left = mid + 1

    return left


# 実行例
loads1 = [7, 2, 5, 10, 8]
k1 = 2

loads2 = [1, 2, 3, 4, 5]
k2 = 2

loads3 = [3, 3, 3]
k3 = 3

print(minimize_max_load(loads1, k1))  # 18
print(minimize_max_load(loads2, k2))  # 9
print(minimize_max_load(loads3, k3))  # 3
