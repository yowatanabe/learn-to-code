def findLengthOfLCIS(nums):
    if not nums:
        return 0

    max_len = 1
    current_len = 1

    for i in range(1, len(nums)):
        if nums[i] > nums[i - 1]:
            current_len += 1
            max_len = max(max_len, current_len)
        else:
            current_len = 1

    return max_len


# 実行例
print(findLengthOfLCIS([1, 3, 5, 4, 7]))  # 3
print(findLengthOfLCIS([2, 2, 2, 2, 2]))  # 1
print(findLengthOfLCIS([1, 2, 3, 4, 5]))  # 5
