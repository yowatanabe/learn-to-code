def two_sum(nums, target):
    num_dict = {}
    for i, num in enumerate(nums):
        complement = target - num
        if complement in num_dict:
            return [num_dict[complement], i]
        num_dict[num] = i
    return []


# 実行例
nums1 = [2, 7, 11, 15]
target1 = 9
print(two_sum(nums1, target1))  # 出力: [0, 1]

nums2 = [3, 2, 4]
target2 = 6
print(two_sum(nums2, target2))  # 出力: [1, 2]

nums3 = [3, 3]
target3 = 6
print(two_sum(nums3, target3))  # 出力: [0, 1]
