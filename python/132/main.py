def two_sum(nums, target):
    seen = {}
    for i, num in enumerate(nums):
        remain = target - num
        if remain in seen:
            return [seen[remain], i]
        seen[num] = i


# テスト
print(two_sum([2, 7, 11, 15], 9))  # 出力: [0, 1]
print(two_sum([3, 2, 4], 6))  # 出力: [1, 2]
print(two_sum([3, 3], 6))  # 出力: [0, 1]
