def longest_log_period(sizes, capacity):
    left = 0
    current_sum = 0
    max_length = 0

    for right in range(len(sizes)):
        current_sum += sizes[right]

        # 合計が capacity を超える間は左端を縮める
        while current_sum > capacity:
            current_sum -= sizes[left]
            left += 1

        max_length = max(max_length, right - left + 1)

    return max_length


# 実行例
sizes1 = [4, 2, 1, 3, 2]
capacity1 = 6

sizes2 = [1, 1, 1, 1, 1]
capacity2 = 3

sizes3 = [7, 2, 3]
capacity3 = 5

print(longest_log_period(sizes1, capacity1))  # 3
print(longest_log_period(sizes2, capacity2))  # 3
print(longest_log_period(sizes3, capacity3))  # 2
