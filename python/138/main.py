def two_sum(nums, target):
    num_map = {}  # 数値とインデックスのマップ
    for i, num in enumerate(nums):
        complement = target - num
        if complement in num_map:
            return [num_map[complement], i]
        num_map[num] = i
    return []


# テスト
print(two_sum([2, 7, 11, 15], 9))  # 出力: [0, 1]
print(two_sum([3, 2, 4], 6))  # 出力: [1, 2]
print(two_sum([3, 3], 6))  # 出力: [0, 1]
