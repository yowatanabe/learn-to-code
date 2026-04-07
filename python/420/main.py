def min_subarray_len(target, errors):
    left = 0
    current_sum = 0
    answer = float("inf")

    for right in range(len(errors)):
        current_sum += errors[right]

        # 条件を満たしている間、左端を縮めて最短化する
        while current_sum >= target:
            answer = min(answer, right - left + 1)
            current_sum -= errors[left]
            left += 1

    return 0 if answer == float("inf") else answer


# 実行例
errors1 = [2, 3, 1, 2, 4, 3]
target1 = 7

errors2 = [1, 4, 4]
target2 = 4

errors3 = [1, 1, 1, 1]
target3 = 10

print(min_subarray_len(target1, errors1))  # 2
print(min_subarray_len(target2, errors2))  # 1
print(min_subarray_len(target3, errors3))  # 0
