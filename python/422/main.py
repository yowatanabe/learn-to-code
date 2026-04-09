def longest_period_within_limit(requests, limit):
    left = 0
    current_sum = 0
    max_length = 0

    for right in range(len(requests)):
        current_sum += requests[right]

        # 合計が上限を超えている間、左端を縮める
        while current_sum > limit and left <= right:
            current_sum -= requests[left]
            left += 1

        # この時点で requests[left:right+1] の合計は limit 以下
        max_length = max(max_length, right - left + 1)

    return max_length


# 実行例
requests1 = [2, 1, 3, 2, 1]
limit1 = 5

requests2 = [1, 1, 1, 1]
limit2 = 3

requests3 = [10, 2, 3]
limit3 = 5

print(longest_period_within_limit(requests1, limit1))  # 2
print(longest_period_within_limit(requests2, limit2))  # 3
print(longest_period_within_limit(requests3, limit3))  # 2
