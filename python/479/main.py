def longest_log_window(logs, limit):
    left = 0
    current_sum = 0
    answer = 0

    for right in range(len(logs)):
        current_sum += logs[right]

        while current_sum > limit:
            current_sum -= logs[left]
            left += 1

        answer = max(answer, right - left + 1)

    return answer


# 実行例
logs1 = [2, 1, 3, 2, 1]
limit1 = 5

logs2 = [1, 1, 1, 1]
limit2 = 3

logs3 = [6, 1, 2, 3]
limit3 = 5

print(longest_log_window(logs1, limit1))  # 2
print(longest_log_window(logs2, limit2))  # 3
print(longest_log_window(logs3, limit3))  # 2
