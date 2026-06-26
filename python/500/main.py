from collections import defaultdict


def count_alert_subarrays(alerts, target):
    prefix_count = defaultdict(int)
    prefix_count[0] = 1

    current_sum = 0
    answer = 0

    for value in alerts:
        current_sum += value

        # current_sum - previous_sum == target
        # previous_sum == current_sum - target
        answer += prefix_count[current_sum - target]

        prefix_count[current_sum] += 1

    return answer


# 実行例
alerts1 = [1, 1, 1]
target1 = 2

alerts2 = [1, 2, 3]
target2 = 3

alerts3 = [3, 4, 7, 2, -3, 1, 4, 2]
target3 = 7

print(count_alert_subarrays(alerts1, target1))  # 2
print(count_alert_subarrays(alerts2, target2))  # 2
print(count_alert_subarrays(alerts3, target3))  # 4
