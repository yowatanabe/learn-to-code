def shortest_metric_window(metrics, target):
    left = 0
    current_sum = 0
    answer = float("inf")

    for right in range(len(metrics)):
        current_sum += metrics[right]

        while current_sum >= target:
            answer = min(answer, right - left + 1)
            current_sum -= metrics[left]
            left += 1

    if answer == float("inf"):
        return 0

    return answer


# 実行例
metrics1 = [1, 2, 3, 4, 5]
target1 = 11

metrics2 = [2, 2, 2]
target2 = 7

metrics3 = [5, 1, 1, 1]
target3 = 5

print(shortest_metric_window(metrics1, target1))  # 3
print(shortest_metric_window(metrics2, target2))  # 0
print(shortest_metric_window(metrics3, target3))  # 1
