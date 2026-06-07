def count_increasing_subarrays(metrics):
    answer = 0
    current_length = 0

    for i in range(len(metrics)):
        if i == 0 or metrics[i] > metrics[i - 1]:
            current_length += 1
        else:
            current_length = 1

        answer += current_length

    return answer


# 実行例
metrics1 = [1, 2, 3]
metrics2 = [3, 2, 1]
metrics3 = [1, 3, 2, 4]

print(count_increasing_subarrays(metrics1))  # 6
print(count_increasing_subarrays(metrics2))  # 3
print(count_increasing_subarrays(metrics3))  # 6
