def max_jobs_within_capacity(jobs, capacity):
    left = 0
    current_sum = 0
    max_length = 0

    for right in range(len(jobs)):
        current_sum += jobs[right]

        while current_sum > capacity:
            current_sum -= jobs[left]
            left += 1

        max_length = max(max_length, right - left + 1)

    return max_length


# 実行例
jobs1 = [3, 1, 2, 1, 4]
capacity1 = 5

jobs2 = [2, 2, 2, 2]
capacity2 = 4

jobs3 = [6, 7, 8]
capacity3 = 5

print(max_jobs_within_capacity(jobs1, capacity1))  # 3
print(max_jobs_within_capacity(jobs2, capacity2))  # 2
print(max_jobs_within_capacity(jobs3, capacity3))  # 0
