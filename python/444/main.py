def max_requests_in_window(requests, window, limit):
    current_sum = sum(requests[:window])
    max_sum = current_sum

    for right in range(window, len(requests)):
        current_sum += requests[right]
        current_sum -= requests[right - window]
        max_sum = max(max_sum, current_sum)

    if max_sum > limit:
        return "OVER_LIMIT"

    return max_sum


# 実行例
requests1 = [10, 20, 30, 5, 10]
window1 = 3
limit1 = 70

requests2 = [50, 30, 20, 10]
window2 = 2
limit2 = 70

requests3 = [1, 2, 3, 4, 5]
window3 = 5
limit3 = 15

print(max_requests_in_window(requests1, window1, limit1))  # 60
print(max_requests_in_window(requests2, window2, limit2))  # OVER_LIMIT
print(max_requests_in_window(requests3, window3, limit3))  # 15
