def count_subarrays_at_least_threshold(errors, threshold):
    n = len(errors)
    left = 0
    current_sum = 0
    count = 0

    for right in range(n):
        current_sum += errors[right]

        while current_sum >= threshold:
            # errors[left:right+1] が条件を満たすなら、
            # right 以降に伸ばした部分配列もすべて条件を満たす
            count += n - right

            current_sum -= errors[left]
            left += 1

    return count


# 実行例
errors1 = [2, 1, 3]
threshold1 = 3

errors2 = [1, 1, 1]
threshold2 = 2

errors3 = [5, 1, 1]
threshold3 = 5

print(count_subarrays_at_least_threshold(errors1, threshold1))  # 4
print(count_subarrays_at_least_threshold(errors2, threshold2))  # 3
print(count_subarrays_at_least_threshold(errors3, threshold3))  # 3
