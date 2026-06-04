def min_total_health_check_time(n, checks):
    best = [float("inf")] * n

    for service, duration in checks:
        best[service] = min(best[service], duration)

    total = 0

    for duration in best:
        if duration == float("inf"):
            return -1
        total += duration

    return total


# 実行例
n1 = 3
checks1 = [[0, 5], [1, 3], [2, 4], [0, 2]]

n2 = 4
checks2 = [[0, 1], [1, 2], [2, 3]]

n3 = 2
checks3 = [[0, 10], [0, 5], [1, 7]]

print(min_total_health_check_time(n1, checks1))  # 9
print(min_total_health_check_time(n2, checks2))  # -1
print(min_total_health_check_time(n3, checks3))  # 12
